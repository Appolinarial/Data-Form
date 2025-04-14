import InputPage from '@/pages/InputPage.vue';
import ResultPage from '@/pages/ResultPage.vue';
import { ROUTES_PATHS } from './router';
import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: ROUTES_PATHS.INPUTPAGE,
      name: 'inputpage',
      component: InputPage,
    },
    {
      path: ROUTES_PATHS.RESULTPAGE,
      name: 'resultpage',
      component: ResultPage,
    },
  ],
});

export default router;
