<template>
   
  
  
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  
  
   
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
        <a class="nav-link" href="#">Iniciar Sesión</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Registrarse</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Mis Viajes</a>
      </li>
        </ul>
    </div>
</nav>
    <MenuAdmin/>
  </div>
</template>

<script>
import MenuAdmin from './components/MenuAdmin.vue'
import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'

export default {
  name: 'App',
  components: {
    MenuAdmin
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
