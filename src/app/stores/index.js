import { defineStore } from 'pinia';

export const useFormStore = defineStore('form', {
  state: () => ({
    city: '',
    department: '',
    employee: '',
    brigade: '',
    shift: '',
  }),
  actions: {
    saveData(data) {
      this.city = data.city;
      this.employee = data.employee;
      this.department = data.department;
      this.brigade = data.brigade;
      this.shift = data.shift;
    },
  },
});
