import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import SuperadminHome from '../views/Superadmin-Home.vue'; // Correctly import the Superadmin-Home component

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/admin-home',
    name: 'Superadmin-Home',
    component: SuperadminHome, // Use the imported component
  },
  {
    path: '/leader-home',
    name: 'Leader-Home',
    component: SuperadminHome, // Use the imported component
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/register',
    name: 'Register',
    component: Register,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const isAuthenticated = localStorage.getItem('userRole') === 'superadmin'; // Adjust based on your actual authentication logic

  if (to.meta.requiresAuth && !isAuthenticated) {
    // Redirect to login or unauthorized page
    next({ name: 'Login' });
  } else if (to.meta.requiresRole && localStorage.getItem('userRole') !== 'superadmin') {
    // Redirect to Home or unauthorized page
    next({ name: 'Home' });
  } else {
    // Proceed to the route
    next();
  }
});

export default router;
