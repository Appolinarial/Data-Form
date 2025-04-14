<script setup>
import AppForm from '@/features/submit-form/ui/AppForm.vue';
import { useFormStore } from '@/app/stores';
import { useRouter } from 'vue-router';
const router = useRouter();

function handleFormSubmit() {
  router.push('/resultpage');
}

</script>

<template>
    <div class="form-container">
    <h2>Форма выбора</h2>
    <AppForm @submit="handleFormSubmit"></AppForm>
  </div>
</template>

<style lang="css">
</style>
