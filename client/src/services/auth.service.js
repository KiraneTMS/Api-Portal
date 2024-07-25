import axios from 'axios';

const API_URL = 'http://localhost:3000/api/'; // Adjust the API URL as needed

class AuthService {
  login(user) {
    return axios
      .post(API_URL + 'login', {
        email: user.email,
        password: user.password,
      })
      .then(response => {
        if (response.data.access_token) {
          localStorage.setItem('user', JSON.stringify(response.data));
        }
        return response.data;
      });
  }

  logout() {
    localStorage.removeItem('user');
  }

  register(user) {
    return axios.post(API_URL + 'register', {
      email: user.email,
      name: user.name,
      password: user.password,
    });
  }
}

export default new AuthService();
