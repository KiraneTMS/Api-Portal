<template>
  <div>
    <header>
      <a href="#" class="logo">
        <img src="https://www.bps.go.id/_next/image?url=%2Fassets%2Flogo-bps.png&w=1080&q=75" alt="Logo">
        <span>BADAN PUSAT STATISTIC.</span>
      </a>
      <ul class="navbarr">
        <li><a href="home" class="active">Home</a></li>
        <li><a href="contact">Contact</a></li>
        <li><a href="login">Login</a></li>
      </ul>
    </header>

    <main>
      <section class="dataset-section">
        <h2>Dataset</h2>
        <p>Temukan kumpulan data mentah yang dapat diolah lebih lanjut sesuai kebutuhan. Ajukan permohonan otorisasi untuk dapat mengunduh data.</p>
        <div class="item">
            <img src="https://via.placeholder.com/150" alt="Item Image">
            <div>
              <h3>Test</h3>
              <p>Description</p>
            </div>
          </div>
        <input type="text" placeholder="Search...">
        <div class="item-list">
        </div>
        <div class="more-items">
          <div class="item" v-for="i in 10" :key="i">
            <img src="https://via.placeholder.com/150" alt="Item Image">
            <div>
              <h3>Item {{ i }}</h3>
            </div>
          </div>
        </div>
      </section>
    </main>
  </div>
  <!-- Footer -->
  <footer>
      <p>Badan Pusat Statistik Provinsi Jawa Barat (Statistics of Jawa Barat)</p>
      <p>JI. PHH. Mustofa No. 43 Bandung 40124, Jawa Barat - Indonesia, Telp: +62 22 7272595, Fax: +62 22 7213572</p>
      <p>Mailbox: bps3200@bps.go.id, pst3200@bps.go.id</p>
    </footer>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

:root {
  --main-color: #0034c2; /* Blue */
  --hover-color: #FB8C00; /* Orange */
  --accent-color: #8BC34A; /* Light Green */
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  font-family: 'Poppins', sans-serif;
  text-decoration: none;
}

html, body {
  margin: 0;
  padding: 0;
  overflow: auto;
  background-color: #ddd;
}

#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

header {
  display: flex;
  align-items: center;
  justify-content: space-between; /* Distribute space between logo and nav items */
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 1000;
  background: linear-gradient(to bottom, var(--main-color), #0035e4); /* Vertical gradient */
  padding: 20px 20px; /* Increase padding to make the header higher */
}

header.scrolled {
  background: linear-gradient(to bottom, var(--hover-color), #F57F17); /* Gradient when scrolled */
}

main {
  margin-top: 60px; /* Adjust based on header height */
  padding: 20px;
  flex: 1; /* Ensures that the main content area expands to fill the space */
}


.logo {
  display: flex;
  align-items: center;
}

.logo img {
  width: 40px;
  margin-right: 10px; /* Adjust spacing between image and text */
  transition: all 0.50s ease;
}

.logo span {
  color: #fff;
  font-size: 1.5rem;
  font-weight: bold;
  transition: all 0.50s ease;
}

.navbarr {
  display: flex;
  align-items: center;
}

.navbarr li {
  margin-left: 30px; /* Space between the buttons */
}

.navbarr a {
  font-size: 1.1rem;
  font-weight: 500;
  padding: 5px 0;
  color: #fff;
  transition: all 0.50s ease;
}

.navbarr a:hover {
  color: var(--hover-color);
}

.navbarr a.active {
  color: var(--hover-color);
}

#menu-icon {
  font-size: 35px;
  color: var(--accent-color);
  cursor: pointer;
  z-index: 10001;
  display: none;
}

@media only screen and (max-width: 1350px) {
  header {
    padding: 14px 2%;
  }

  .navbarr a {
    padding: 5px 0;
    margin: 0 20px;
  }
}

@media only screen and (max-width: 1090px) {
  #menu-icon {
    display: block;
  }

  .navbarr {
    position: absolute;
    top: 60px; /* Adjust if necessary */
    right: -100%;
    width: 270px;
    height: calc(100vh - 60px); /* Full height minus header height */
    background-color: var(--main-color);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border-radius: 10px;
    padding-top: 20px;
    padding-bottom: 20px;
    transition: all 0.50s ease;
  }

  .navbarr li {
    margin-left: 0; /* Reset margin for mobile view */
  }

  .navbarr a {
    display: block;
    margin: 12px 0;
    padding: 0 25px;
    color: #fff;
  }

  .navbarr a:hover {
    color: var(--hover-color);
    transform: translateX(7px);
  }

  .navbarr a.active {
    color: var(--hover-color);
  }

  .navbarr.open {
    right: 2%;
  }

  .logo img {
    margin-left: 10px;
    width: 30px;
  }

  .logo span {
    font-size: 1.1rem;
  }
}

main {
  padding-top: 80px; /* Ensure content is not hidden behind fixed header */
}

.dataset-section {
  background-color: #fff;
  padding: 20px;
}

.dataset-section h2 {
  color: #000;
  margin-bottom: 10px;
  text-align: left; /* Align text to the left */
}


.dataset-section p {
  margin-bottom: 20px;
}

.item-list, .more-items {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.item {
  display: flex;
  align-items: center;
  width: 100%; /* Ensure full width */
  margin-bottom: 20px;
  border: 1px solid #ddd;
  padding: 10px;
  background-color: #f9f9f9;
}

.item img {
  width: 150px;
  height: auto;
  margin-right: 20px;
}

.item div {
  flex: 1;
}

input[type="text"] {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ddd;
  border-radius: 4px;
}
footer {
  background-color: #ddd;
  color: #000;
  text-align: center;
  padding: 20px;
  font-size: 0.9rem;
}

footer p {
  margin: 5px 0;
}

</style>
