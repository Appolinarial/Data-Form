<script setup>
import { ref, computed } from 'vue';
import data from '@/entities/data/api/data.json';
import AppButton from '@/shared/ui/AppButton.vue';
import { useFormStore } from '@/app/stores/index';
import { useRouter } from 'vue-router';

const router = useRouter();
const formStore = useFormStore();

const cities = ref(data.cities);
const departments = ref(data.departments);
const employees = ref(data.employees);
const brigades = ref(data.brigades);
const shifts = ref(data.shifts);

const selectedCityId = ref(null);
const selectedDepartmentId = ref(null);
const selectedEmployeeName = ref(null); 
const selectedBrigade = ref(null);
const selectedShift = ref(null);

const filteredDepartments = computed(() => {
  return departments.value.filter(department => department.cityId === selectedCityId.value);
});

const filteredEmployees = computed(() => {
  return employees.value.filter(employee => employee.departmentId === selectedDepartmentId.value);
});

function updateDepartments() {
  selectedDepartmentId.value = null;
  selectedEmployeeName.value = null;
}

function updateEmployees() {
  selectedEmployeeName.value = null;
}
function handleSubmit() {
  const selectedCityName = cities.value.find(city => city.id === selectedCityId.value)?.name || '';
  const selectedDepartmentName = departments.value.find(department => department.id === selectedDepartmentId.value)?.name || '';

  const formData = {
    city: selectedCityName,
    department: selectedDepartmentName,
    employee: selectedEmployeeName.value,
    brigade: selectedBrigade.value,
    shift: selectedShift.value
  };

  formStore.saveData(formData);

  router.push('/resultpage');
}
</script>

<template>
  <form @submit.prevent="handleSubmit">
    <div class="form-group">
      <label for="city">Город:</label>
      <select id="city" v-model="selectedCityId" @change="updateDepartments">
        <option v-for="city in cities" :key="city.id" :value="city.id">{{ city.name }}</option>
      </select>
    </div>

    <div class="form-group">
      <label for="department">Цех:</label>
      <select id="department" v-model="selectedDepartmentId" @change="updateEmployees" :disabled="!selectedCityId">
        <option v-for="department in filteredDepartments" :key="department.id" :value="department.id">{{ department.name }}</option>
      </select>
    </div>

    <div class="form-group">
      <label for="employee">Сотрудник:</label>
      <select id="employee" v-model="selectedEmployeeName" :disabled="!selectedDepartmentId">
        <option v-for="employee in filteredEmployees" :key="employee.id" :value="employee.name">{{ employee.name }}</option>
      </select>
    </div>

    <div class="form-group">
      <label for="brigade">Бригада:</label>
      <select id="brigade" v-model="selectedBrigade">
        <option v-for="brigade in brigades" :key="brigade.id" :value="brigade.name">{{ brigade.name }}</option>
      </select>
    </div>

    <div class="form-group">
      <label for="shift">Смена:</label>
<select id="shift" v-model="selectedShift">
  <option v-for="shift in shifts" :key="shift.id" :value="shift.name">{{ shift.name }}</option>
</select>
</div>

<AppButton text="Сохранить" />
</form>
</template>

<style lang="css">
form {
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
  background: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
}

select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 16px;
  transition: border-color 0.3s ease;
}

select:focus {
  border-color: #007bff; /* Цвет фокуса */
  outline: none; /* Убираем стандартный контур */
}

@media (max-width: 600px) {
  form {
    padding: 15px;
    width: calc(100% - 40px);
  }
}
</style>