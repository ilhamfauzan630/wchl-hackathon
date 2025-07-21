// src/router/index.js
import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '@/pages/home/Home.vue'
import Wallets from '@/pages/wallets/Wallets.vue'
import Setting from '@/pages/settings/Setting.vue'
import NotFound from '@/pages/error/NotFound.vue'

const routes = [
  { path: '/', name: 'home', component: Home },
  { path: '/wallets', name: 'wallets', component: Wallets },
  { path: '/setting', name: 'setting', component: Setting },
  { path: '/:pathMatch(.*)*', name: 'notfound', component: NotFound }, // fallback 404
]

const router = createRouter({
  history: createWebHashHistory(), // pake hash (#) atau use createWebHistory()
  routes,
  linkActiveClass: 'active-link',
})

export default router