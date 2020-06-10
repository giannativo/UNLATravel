<template>
  <div id="app">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand nav-item nav-link" @click="cargaHome" href="#">UNLATravel</a>
      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul id="navbar-options" class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" v-if="userLogged" href="#"><i class="fas fa-user-alt"></i> {{usuario.Nombre}} {{usuario.Apellido}}</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" @click="cargaHome" href="#"><i class="fas fa-globe-americas"></i> Destinos</a>
          </li>          
          <li class="nav-item">
            <a class="nav-link" @click="cargaLogin" v-if="!userLogged" href="#"><i class="fas fa-user-friends"></i> Iniciar Sesión</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" @click="cargaRegistro" v-if="!userLogged" href="#"><i class="fas fa-envelope"></i> Registrarse</a>
          </li>
          <li class="nav-item" v-if="showTravels">
            <a class="nav-link" @click="cargaMiperfil" href="#"><i class="fas fa-user-alt"></i> Mi Perfil</a>
          </li>
          <li class="nav-item" v-if="showReservation">
            <a class="nav-link" @click="cargaReserva" href="#"><i class="fas fa-umbrella-beach"></i> Ver Reserva</a>
          </li>
          <li class="nav-item" v-if="userLogged">
            <a class="nav-link" @click="logout" href="#"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="./assets/unlaLogo.jpg" alt="" width="72" height="72">  
    </div>
    <MenuAdmin v-if="showMenuAdmin"/>
    <Login v-if="showLogin"/>
    <Registro v-if="showRegistro"/>
    <Home v-if="showHome" ref="home"/>
    <MiPerfil v-if="showPerfil"/>
    <VistaReserva v-if="showReserva"/>
  </div>
</template>

<script>
import MenuAdmin from "./components/MenuAdmin.vue";
import Registro from "./components/Registro.vue";
import Login from "./components/Login.vue";
import Home from "./components/Home.vue";
import MiPerfil from "./components/UserPerfil/MiPerfil.vue";
import VistaReserva from "./components/VistaReserva.vue";
import "@fortawesome/fontawesome-free/css/all.css";
import "@fortawesome/fontawesome-free/js/all.js";
export default {
  name: "App",
  components: {
    MenuAdmin,
    Registro,
    Login,
    Home,
    MiPerfil,
    VistaReserva
  },
  props: {
    showHome: {
        type: Boolean,
        default: true
    },
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
        default: false
    },
    showPerfil: {
        type: Boolean,
        default: false
    },
    usuario: null,
    reserva: null,
    userLogged: {
        type: Boolean,
        default: false
    },
    adminLogged: {
        type: Boolean,
        default: false
    },
    showTravels: {
      type: Boolean,
      default: false
    },
    showReservation: {
      type: Boolean,
      default: false
    },
    showReserva: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    cargaLogin: function () {
      this.showLogin = true,
      this.showMenuAdmin = false,
      this.showRegistro = false,
      this.showHome = false,
      this.showPerfil = false,
      this.showReserva = false
    },
    cargaRegistro: function(){
      this.showRegistro = true,
      this.showMenuAdmin = false,
      this.showLogin = false,
      this.showHome = false,
      this.showPerfil = false,
      this.showReserva = false
    },
    cargaHome() {
      this.showLogin = false,
      this.showRegistro = false,
      this.showMenuAdmin = false,
      this.showHome = true,
      this.showPerfil = false,
      this.showReserva = false,
      this.$refs.home.init()
    },
    cargaAdmin() {
      this.showLogin = false,
      this.showRegistro = false,
      this.showMenuAdmin = true,
      this.showHome = false,
      this.showPerfil = false,
      this.showReserva = false
    },
    cargaMiperfil(){
      this.showLogin = false,
      this.showRegistro = false,
      this.showMenuAdmin = false,
      this.showHome = false,
      this.showPerfil = true,
      this.showReserva = false
    },
    cargaReserva(){
      this.showLogin = false,
      this.showRegistro = false,
      this.showMenuAdmin = false,
      this.showHome = false,
      this.showPerfil = false,
      this.showReserva = true      
    },
    init() {
      var token = localStorage.getItem('token');
      if(token){
        this.usuario = JSON.parse(JSON.parse(atob(token.split(".")[1])).UserData);
        this.userLogged = true;
        if(this.usuario.IsAdmin){
          this.cargaAdmin();
          this.showTravels = false;
        }
        else{
          this.cargaHome();
          this.showTravels = true;
          this.$axios
          .get("https://localhost:57935/api/reserva/usuario/" + this.usuario.Id)
          .then(response => {
            if(response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;}).length > 0){
              this.reserva = response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;})[0];
              this.showReservation = true;
            }
          });   
        }
      }
      else{
        this.userLogged = false;
        this.showTravels = false;
        this.showReservation = false;
        this.cargaHome();
      }
    },
    logout() {
      localStorage.removeItem('token');
      this.init();
    }
  },
  mounted() {
    this.init();
  },
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
.navbar-brand {
  margin-right: 0 !important;
  color: white !important;
}
.navbar-collapse, .navbar-brand {
  background-color: darkred;
}
.navbar-light .navbar-nav .nav-link, .fas {
  color: white !important;
}
</style>

