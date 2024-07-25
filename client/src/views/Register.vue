<template>
    <div class="register">
      <h2>Register</h2>
      <form @submit.prevent="handleRegister">
        <div>
          <label for="name">Name:</label>
          <input type="text" v-model="name" required />
        </div>
        <div>
          <label for="email">Email:</label>
          <input type="email" v-model="email" required />
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" v-model="password" required />
        </div>
        <button type="submit">Register</button>
      </form>
      <p v-if="error" class="error">{{ error }}</p>
    </div>
  </template>
  
  <script>
  import AuthService from "../services/auth.service";
  
  export default {
    data() {
      return {
        name: "",
        email: "",
        password: "",
        error: null,
      };
    },
    methods: {
      handleRegister() {
        AuthService.register({ name: this.name, email: this.email, password: this.password })
          .then(() => {
            this.$router.push("/login");
          })
          .catch((error) => {
            this.error = "Failed to register.";
          });
      },
    },
  };
  </script>
  
  <style scoped>
  .register {
    max-width: 300px;
    margin: auto;
  }
  
  .error {
    color: red;
  }
  </style>
  