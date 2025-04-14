<script setup>
const props = defineProps({
    text: {
        type: String,
        defauit: ''
    }
})
</script>

<template>
    <button type="submit" class="app-button">{{text}}</button>
</template>

<style lang="css">
.app-button {
  display: inline-block;
  padding: 10px 20px;
  background: linear-gradient(90deg, #007bff, #0056b3);
  color: white;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease;
}

.app-button:hover {
  background-color: #0056b3;
}

.app-button:active {
  transform: scale(0.95);
}
</style>