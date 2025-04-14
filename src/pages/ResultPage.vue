<script setup>
import AppButton from '@/shared/ui/AppButton.vue';
import { useRouter } from 'vue-router';
import { useFormStore } from '@/app/stores/index';

const router = useRouter();
const formStore = useFormStore();
function goToForm() {
  router.push('/');
}
</script>

<template>
  <div class="container">
    <h2>Данные сохранены</h2>
    <ul>
      <li>{{ formStore.city }}</li>
      <li>{{ formStore.department }}</li>
      <li>{{ formStore.employee }}</li>
      <li>{{ formStore.brigade }}</li>
      <li>{{ formStore.shift }}</li>
    </ul>
    <AppButton @click="goToForm" text="Вернуться назад"/>
  </div>
</template>

<style lang="css">
h2 {
  font-size: 24px;
  margin-bottom: 15px;
  color: #333;
  text-align: center;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  padding: 10px;
  border-bottom: 1px solid #eee;
  font-size: 18px;
  color: #555;
}

li:last-child {
  border-bottom: none;
}

li:hover {
  background-color: #f0f8ff;
}
</style>