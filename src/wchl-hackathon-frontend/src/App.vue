<!-- <script setup>
import { ref } from 'vue';
import { wchl_hackathon_backend } from 'declarations/wchl-hackathon-backend/index';
let greeting = ref('');

async function handleSubmit(e) {
  e.preventDefault();
  const target = e.target;
  const name = target.querySelector('#name').value;
  await wchl_hackathon_backend.greet(name).then((response) => {
    greeting.value = response;
  });
}
</script>

<template>
  <main>
    <img src="/logo2.svg" alt="DFINITY logo" />
    <br />
    <br />
    <form action="#" @submit="handleSubmit">
      <label for="name">Enter your name: &nbsp;</label>
      <input id="name" alt="Name" type="text" />
      <button type="submit">Click Me!</button>
    </form>
    <section id="greeting">{{ greeting }}</section>
  </main>
</template> -->

<template>
  <div class="flex h-screen">
    <!-- Gunakan komponen Sidebar -->
    <Sidebar />

    <!-- Main Content -->
    <main class="flex-1 text-white p-6 overflow-auto">
      <RouterView/>
    </main>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar.vue'

export default {
  components: {
    Sidebar
  },
}
</script>

<style>
main {
  background-color: #0F1724;
}
</style>