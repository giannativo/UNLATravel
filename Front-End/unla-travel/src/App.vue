<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul id="navbar-options" class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" @click="cargaLogin" href="#">Iniciar Sesión</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" @click="cargaRegistro" href="#">Registrarse</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Mis Viajes</a>
          </li>
        </ul>
      </div>
    </nav>
    <MenuAdmin v-if="showMenuAdmin"/>
    <Login v-if="showLogin"/>
    <Registro v-if="showRegistro"/>
  </div>
</template>

<script>
import MenuAdmin from "./components/MenuAdmin.vue";
import Registro from "./components/Registro.vue";
import Login from "./components/Login.vue"
import "@fortawesome/fontawesome-free/css/all.css";
import "@fortawesome/fontawesome-free/js/all.js";

export default {
  name: "App",
  components: {
    MenuAdmin,
    Registro,
    Login
  },
  props:{
    showLogin: {
        type: Boolean,
        default: false
    },
    showRegistro: {
        type: Boolean,
        default: false
    },
    showMenuAdmin: {
        type: Boolean,
        default: true
    },
    usuario: null
  },

  methods: {
    cargaLogin: function () {
      this.showLogin = true,
      this.showMenuAdmin = false,
      this.showRegistro = false
    },
    cargaRegistro: function(){
      this.showRegistro = true,
      this.showMenuAdmin = false
      this.showLogin = false
    },
    cargaHome() {
      this.showLogin = false,
      this.showRegistro = false,
      this.showMenuAdmin = true
    }
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.navbar {
  padding: 0 !important;
}
.navbar-collapse {
  background-color: darkred;
}
.navbar-light .navbar-nav .nav-link {
  color: white !important;
}
</style>
