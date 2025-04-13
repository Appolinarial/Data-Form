import InputPage from '@/pages/InputPage.vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'inputpage',
      component: InputPage,
    },
  ],
})

export default router
