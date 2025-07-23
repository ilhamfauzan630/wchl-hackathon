<template>
  <div class="p-6 space-y-6">
    <h2 class="text-3xl font-bold text-white">Online Gambling On-Chain Analysis</h2>

    <!-- Form input wallet -->
    <section>
      <form @submit.prevent="analyzeWallet" class="flex flex-col sm:flex-row items-left gap-4">
        <input
          v-model="walletAddress"
          type="text"
          placeholder="Input wallet address"
          class="flex-1 px-4 py-2 text-white rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 text-base"
        />
        <button
          type="submit"
          class="px-6 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-md font-semibold text-base">
          ANALYZE
        </button>
      </form>
    </section>

    <!-- Chart visualisasi -->
    <section v-if="chartData">
      <h3 class="text-lg font-semibold text-white mb-2">Risk Distribution</h3>
      <div class="w-full h-96 bg-white rounded-md p-4">
        <canvas id="txChart"></canvas>
      </div>
    </section>

    <!-- Tabel reporting -->
    <section>
      <h3 class="text-lg font-semibold text-white mb-2">Detection & Reporting</h3>
      <div class="overflow-x-auto">
        <table class="min-w-full rounded-md overflow-hidden">
          <thead>
            <tr class="title">
              <th class="px-6 py-3 text-left text-lg">Wallet</th>
              <th class="px-6 py-3 text-left text-lg">Transactions</th>
              <th class="px-6 py-3 text-left text-lg">Risk</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(r, i) in reports" :key="i" class="border-t border-gray-700 hover:bg-gray-700">
              <td class="px-6 py-3 text-base">{{ r.wallet }}</td>
              <td class="px-6 py-3 text-base">{{ r.txCount }}</td>
              <td :class="['px-6 py-3 text-base font-semibold', riskColor(r.risk)]">
                {{ r.risk }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import Chart from 'chart.js/auto'
import chainpatrol from '../../dfinity/chainpatrol.js' // Pastikan path ini benar

const walletAddress = ref('')
const reports = ref([])
const chartInstance = ref(null)
const chartData = ref(null)

function riskColor(risk) {
  return risk === 'High'
    ? 'text-red-500'
    : risk === 'Judol'
    ? 'text-yellow-400'
    : 'text-green-400'
}

async function analyzeWallet() {
  if (!walletAddress.value) return;

  try {
    const result = await chainpatrol.analyzeWallet(walletAddress.value);

    if (result.length === 0) {
      alert("Wallet tidak ditemukan dalam database.");
      reports.value = [];
      chartData.value = null;
      if (chartInstance.value) chartInstance.value.destroy();
      return;
    }

    const updated = result.map(w => {
      const tx = Math.floor(Math.random() * 1000); // Dummy tx count
      let riskLevel = 'Safe';
      if (w.riskScore >= 80) {
        riskLevel = 'Judol';
      } else if (w.riskScore >= 50) {
        riskLevel = 'High';
      }
      return {
        wallet: w.id,
        txCount: tx,
        risk: riskLevel
      };
    });

    reports.value = updated;
    updateChart(updated);
  } catch (e) {
    console.error("Gagal analisa wallet:", e);
  }
}

function updateChart(data) {
  const counts = { Safe: 0, High: 0, Judol: 0 };
  data.forEach(w => counts[w.risk] += 1);

  chartData.value = {
    labels: ['Safe', 'High Risk', 'Judol'],
    datasets: [{
      label: 'Wallets',
      data: [counts.Safe, counts.High, counts.Judol],
      backgroundColor: ['#10b981', '#ef4444', '#facc15']
    }]
  };

  const ctx = document.getElementById('txChart').getContext('2d');
  if (chartInstance.value) chartInstance.value.destroy();

  chartInstance.value = new Chart(ctx, {
    type: 'bar',
    data: chartData.value,
    options: {
      scales: {
        y: { beginAtZero: true }
      }
    }
  });
}
</script>

<style scoped>
section {
  padding-block: 20px;
}
input {
  background-color: #172433;
}
.title {
  background-color: #172433;
}
</style>
