<template>
  <div class="wrapper">
    <div class="form-wrapper sign-in">
      <form @submit.prevent="handleSubmit">
        <h2>Login</h2>
        <div class="input-group">
          <input v-model="user.email" type="email" required>
          <label for="">Email</label>
        </div>
        <div class="input-group">
          <input v-model="user.password" type="password" required>
          <label for="">Password</label>
        </div>
        <div class="forgot-pass">
          <a href="#">Forgot Password?</a>
        </div>
        <button type="submit" class="btn">Login</button>
        <div class="sign-link">
          <p>Don't have an account? <a href="#" class="signUp-link" @click.prevent="toggleForm">Sign Up</a></p>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import AuthService from '@/services/auth.service'; // Adjust path as per your project structure

export default {
  data() {
    return {
      user: {
        email: '',
        password: ''
      }
    };
  },
  methods: {
    async handleSubmit() {
      try {
        const response = await AuthService.login(this.user);
        console.log('Login successful:', response);
        // Handle successful login (e.g., redirect to dashboard)
      } catch (error) {
        console.error('Login error:', error);
        // Handle login error (e.g., show error message to user)
      }
    },
    toggleForm() {
      const wrapper = this.$el.querySelector('.wrapper');
      wrapper.classList.toggle('animate-signUp');
      wrapper.classList.toggle('animate-signIn');
    }
  }
};
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}

body, html {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(#1f58f3, #4977f7);
  overflow: hidden;
}

.wrapper {
  position: relative;
  width: 400px;
  height: 500px;
}

.form-wrapper {
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  background: #F0F5F9;
  box-shadow: 0 0 10px rgba(0, 0, 0, .2);
}

.wrapper.animate-signUp .form-wrapper.sign-in {
  transform: rotate(7deg);
  animation: animateRotate .7s ease-in-out forwards;
  animation-delay: .3s;
}

.wrapper.animate-signIn .form-wrapper.sign-in {
  animation: animateSignIn 1.5s ease-in-out forwards;
}

@keyframes animateSignIn {
  0% {
    transform: translateX(0);
  }
  50% {
    transform: translateX(-500px);
  }
  100% {
    transform: translateX(0) rotate(7deg);
  }
}

.wrapper .form-wrapper.sign-up {
  transform: rotate(2deg);
}

.wrapper.animate-signIn .form-wrapper.sign-up {
  animation: animateRotate .7s ease-in-out forwards;
  animation-delay: .3s;
}

@keyframes animateRotate {
  0% {
    transform: rotate(7deg);
  }
  100% {
    transform: rotate(0);
    z-index: 1;
  }
}

.wrapper.animate-signUp .form-wrapper.sign-up {
  animation: animateSignUp 1.5s ease-in-out forwards;
}

@keyframes animateSignUp {
  0% {
    transform: translateX(0);
    z-index: 1;
  }
  50% {
    transform: translateX(500px);
  }
  100% {
    transform: translateX(0) rotate(7deg);
  }
}

h2 {
  font-size: 30px;
  color: #0034c2; /* Blue */
  text-align: center;
}

.input-group {
  position: relative;
  width: 320px;
  margin: 30px 0;
}

.input-group label {
  position: absolute;
  top: 50%;
  left: 5px;
  transform: translateY(-50%);
  font-size: 16px;
  color: #0034c2; /* Blue */
  padding: 0 5px;
  pointer-events: none;
  transition: .5s;
}

.input-group input {
  width: 100%;
  height: 40px;
  font-size: 16px;
  color: #0034c2; /* Blue */
  padding: 0 10px;
  background: transparent;
  border: 1px solid #0034c2; /* Blue */
  outline: none;
  border-radius: 5px;
}

.input-group input:focus ~ label,
.input-group input:valid ~ label {
  top: 0;
  font-size: 12px;
  background: #F0F5F9;
}

.forgot-pass {
  margin: -15px 0 15px;
}

.forgot-pass a {
  color: #0034c2; /* Blue */
  font-size: 14px;
  text-decoration: none;
}

.forgot-pass a:hover {
  text-decoration: underline;
}

.btn {
  position: relative;
  top: 0;
  left: 0;
  width: 100%;
  height: 40px;
  background: linear-gradient(to right, #0034c2, #21a3fa); /* Blue gradient */
  box-shadow: 0 2px 10px rgba(0, 0, 0, .4);
  font-size: 16px;
  color: #F0F5F9;
  font-weight: 500;
  cursor: pointer;
  border-radius: 5px;
  border: none;
  outline: none;
}

.sign-link {
  font-size: 14px;
  text-align: center;
  margin: 25px 0;
}

.sign-link p {
  color: #1E2022;
}

.sign-link p a {
  color: #FB8C00; /* Orange */
  text-decoration: none;
  font-weight: 600;
}

.sign-link p a:hover {
  text-decoration: underline;
}
</style>
