<script setup>

</script>

<template>
  <aside class="w-64 text-white p-4">
    <nav class="mt-4 space-y-2">
      <h1 class="px-2 py-1 text-base">ChainPatrol</h1>
      <router-link to="/" class="block px-2 py-1 text-base rounded"><i class="fa-solid fa-gauge" style="color: #ffffff;"></i> Dashboard</router-link>
      <router-link to="/wallets" class="block px-2 py-1 text-base rounded"><i class="fa-solid fa-wallet" style="color: #ffffff;"></i> Wallets</router-link>
      <router-link to="/summary" class="block px-2 py-1 text-base rounded"><i class="fa-solid fa-clipboard-list" style="color: #ffffff;"></i> Summary</router-link>
      <router-link to="/setting" class="block px-2 py-1 text-base rounded"><i class="fa-solid fa-gear"></i> Settings</router-link>
    </nav>
  </aside>
</template>


<script>
export default {
  name: 'Sidebar'
}
</script>

<style scoped>
aside {
  background-color: #0F1724;
}
.active-link {
  background-color: #21334A; /* contoh biru gelap */
  color: white;
}
i {
  padding-inline: 10px;
}

</style>