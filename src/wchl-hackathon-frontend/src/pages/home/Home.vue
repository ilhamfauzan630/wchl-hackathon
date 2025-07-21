<template>
  <div class="p-6 space-y-6">
    <h2 class="text-3xl font-bold text-white">Online Gambling On-Chain Analisys</h2>

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

    <section>
      <h3 class="text-lg font-semibold text-white mb-2">Transaction Visualization</h3>
      <div class="w-full h-64 bg-gray-700 rounded-md flex items-center justify-center">
        <span class="text-base text-gray-400">[ Transaction Graph Placeholder ]</span>
      </div>
    </section>

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
            <tr v-for="(r, i) in reports" :key="i" class="border-t border-gray-700">
              <td class="px-6 py-3 text-base">{{ r.wallet }}</td>
              <td class="px-6 py-3 text-base">{{ r.txCount }}</td>
              <td :class="['px-6 py-3 text-base font-semibold', r.risk === 'High' ? 'text-red-500' : 'text-green-400']">
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

const walletAddress = ref('')
const reports = ref([
  { wallet: '0xabc123...', txCount: 1234, risk: 'High' },
  { wallet: '0xdef456...', txCount: 5678, risk: 'Low' },
  { wallet: '0xghi789...', txCount: 8912, risk: 'High' }
])

function analyzeWallet() {
  alert('Fitur ini belum tersedia')
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