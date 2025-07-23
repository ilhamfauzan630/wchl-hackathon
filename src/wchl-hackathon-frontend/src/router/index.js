// src/router/index.js
import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '@/pages/home/Home.vue'
import Wallets from '@/pages/wallets/Wallets.vue'
import Setting from '@/pages/settings/Setting.vue'
import NotFound from '@/pages/error/NotFound.vue'
import Summary from '@/pages/summary/Summary.vue'

const routes = [
  { path: '/', name: 'home', component: Home },
  { path: '/wallets', name: 'wallets', component: Wallets },
  { path: '/setting', name: 'setting', component: Setting },
  { path: '/summary', name: 'summary', component: Summary},
  { path: '/:pathMatch(.*)*', name: 'notfound', component: NotFound },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes,
  linkActiveClass: 'active-link',
})

export default router
