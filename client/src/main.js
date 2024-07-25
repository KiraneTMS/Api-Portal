import { createApp } from 'vue';
import App from './App.vue';
import router from './router';

// Import jQuery
import $ from 'jquery';

// Make jQuery available globally
window.$ = window.jQuery = $;

// Create Vue app
const app = createApp(App);

// Use Vue Router
app.use(router);

// Mount Vue app
app.mount('#app');

// Ensure jQuery is available for the entire app
app.config.globalProperties.$ = $;
