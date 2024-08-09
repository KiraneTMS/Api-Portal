<template>
    <div>
      <img src="path_to_your_image_banner.jpg" alt="Banner" style="width: 100%;" />
      <h2>Data Table</h2>
      <table>
        <thead>
          <tr>
            <th>Kelompok</th>
            <th>Kota</th>
            <th>Desa</th>
            <th>Jumlah</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in data" :key="item.id">
            <td>{{ item.kelompok }}</td>
            <td>{{ item.kota }}</td>
            <td>{{ item.desa }}</td>
            <td>{{ item.jumlah }}</td>
          </tr>
        </tbody>
      </table>
      <p>Showing {{ data.length }} items from {{ totalItems }}</p>
      <button @click="prevPage" :disabled="page === 1">Prev</button>
      <button @click="nextPage" :disabled="page === totalPages">Next</button>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        data: [],
        page: 1,
        totalItems: 0,
        itemsPerPage: 10,
        totalPages: 0,
      };
    },
    methods: {
      fetchData() {
        axios
          .get(`/api/data`, { params: { page: this.page, limit: this.itemsPerPage } })
          .then((response) => {
            this.data = response.data.items;
            this.totalItems = response.data.totalItems;
            this.totalPages = Math.ceil(this.totalItems / this.itemsPerPage);
          })
          .catch((error) => {
            console.error('Error fetching data:', error);
          });
      },
      nextPage() {
        if (this.page < this.totalPages) {
          this.page += 1;
          this.fetchData();
        }
      },
      prevPage() {
        if (this.page > 1) {
          this.page -= 1;
          this.fetchData();
        }
      },
    },
    mounted() {
      this.fetchData();
    },
  };
  </script>
  
  <style scoped>
  table {
    width: 100%;
    border-collapse: collapse;
  }
  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  th {
    background-color: #f2f2f2;
  }
  button {
    margin: 5px;
  }
  </style>
  