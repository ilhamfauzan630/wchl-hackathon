<template>
  <section class="text-white p-6">
    <h2 class="text-xl font-bold mb-6">Riwayat Transaksi Wallet</h2>

    <div class="mb-6">
      <label class="block text-lg mb-2">Pilih Wallet:</label>
      <select v-model="selectedWallet" class="w-full px-4 py-2 rounded text-base bg-white text-black">
        <option disabled value="" class="text-base">-- Pilih Wallet --</option>
        <option v-for="wallet in wallets" :key="wallet.address" :value="wallet.address" class="text-base">
          {{ wallet.address }}
        </option>
      </select>
    </div>

    <transition name="fade-slide" mode="out-in">
      <div :key="transactionHistory.length">
        <div v-if="transactionHistory.length" class="overflow-x-auto">
          <h3 class="text-lg font-semibold mb-4">Riwayat untuk: {{ selectedWallet }}</h3>
          <table class="min-w-full table-auto bg-gray-800 rounded-md">
            <thead class="title text-left">
              <tr>
                <th class="px-6 py-3 text-lg">Tanggal</th>
                <th class="px-6 py-3 text-lg">Tipe</th>
                <th class="px-6 py-3 text-lg">Jumlah</th>
                <th class="px-6 py-3 text-lg">Tujuan/Asal</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(tx, index) in transactionHistory"
                :key="index"
                class="border-t border-gray-700 bg-gray-900 hover:bg-gray-700"
              >
                <td class="px-6 py-3 text-base">{{ tx.date }}</td>
                <td class="px-6 py-3 text-base">{{ tx.type }}</td>
                <td class="px-6 py-3 text-base">{{ tx.amount }}</td>
                <td class="px-6 py-3 text-base">{{ tx.counterparty }}</td>
              </tr>
            </tbody>
          </table>
        </div>

        <p v-else class="text-gray-400 text-lg">
          Silakan pilih wallet untuk melihat riwayat transaksi.
        </p>
      </div>
    </transition>
  </section>
</template>

<script>
export default {
  name: 'Wallets',
  data() {
    return {
      selectedWallet: '',
      wallets: [
        { address: '0xabc123...' },
        { address: '0xdef456...' },
        { address: '0x789ghi...' }
      ],
      history: {
        '0xabc123...': [
          { date: '2025-07-18', type: 'Deposit', amount: '100 ICP', counterparty: '0xother1...' },
          { date: '2025-07-19', type: 'Withdraw', amount: '20 ICP', counterparty: '0xother2...' },
        ],
        '0xdef456...': [
          { date: '2025-07-17', type: 'Deposit', amount: '500 ICP', counterparty: '0xbank1...' },
        ],
        '0x789ghi...': [
          { date: '2025-07-21', type: 'Withdraw', amount: '200 ICP', counterparty: '0xcasino1...' },
        ]
      }
    };
  },
  computed: {
    transactionHistory() {
      return this.history[this.selectedWallet] || [];
    }
  }
};
</script>

<style scoped>
.title {
  background-color: #172433;
}

/* Transisi fade + slide */
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.4s ease;
}
.fade-slide-enter-from {
  opacity: 0;
  transform: translateY(10px);
}
.fade-slide-enter-to {
  opacity: 1;
  transform: translateY(0);
}
.fade-slide-leave-from {
  opacity: 1;
  transform: translateY(0);
}
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(10px);
}
</style>
