<template>
<div class="container">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="../assets/unlaLogo.jpg" alt="" width="72" height="72">  
    </div>
    <div class="text-center" v-if="showMenuABM">
        <div class="row">
            <div class="options text-center">                
                <button @click="cargaVuelo" type="button" class="btn btn-lg btn-block btn-primary">ABM Vuelos</button>
                <button @click="cargaAlojamiento" type="button" class="btn btn-lg btn-block btn-primary">ABM Alojamientos</button>
                <button @click="cargaActividad" type="button" class="btn btn-lg btn-block btn-primary">ABM Actividades</button>
                <button @click="cargaDestino" type="button" class="btn btn-lg btn-block btn-primary">ABM Destinos</button>
                <button @click="cargaPaquete" type="button" class="btn btn-lg btn-block btn-primary">ABM Paquetes</button>
                <button @click="cargaUsuario" type="button" class="btn btn-lg btn-block btn-primary">ABM Administradores</button>
            </div>
        </div>
    </div>
    <ABMVuelo v-if="showABMVuelo"/>
    <ABMAlojamiento v-if="showABMAlojamiento"/>
    <ABMActividad v-if="showABMActividad"/>
    <ABMDestino v-if="showABMDestino"/>
    <ABMPaquete v-if="showABMPaquete"/>
    <ABMUsuario v-if="showABMUsuario"/>
</div>
</template>

<script>
import ABMVuelo from './AdminVuelo/ABMVuelo.vue'
import ABMAlojamiento from './AdminAlojamiento/ABMAlojamiento.vue'
import ABMActividad from './AdminActividad/ABMActividad.vue'
import ABMDestino from './AdminDestino/ABMDestino.vue'
import ABMPaquete from './AdminPaquete/ABMPaquete.vue'
import ABMUsuario from './AdminUsuario/ABMUsuario.vue'

export default {
  name: 'MenuAdmin',
  components: {
      ABMVuelo,
      ABMAlojamiento,
      ABMActividad,
      ABMDestino,
      ABMPaquete,
      ABMUsuario
  },
  props: {
    showMenuABM: {
        type: Boolean,
        default: true
    },
    showABMVuelo: {
        type: Boolean,
        default: false
    },
    showABMAlojamiento: {
        type: Boolean,
        default: false
    },
     showABMActividad: {
        type: Boolean,
        default: false
    },
     showABMPaquete: {
        type: Boolean,
        default: false
    },
     showABMUsuario: {
        type: Boolean,
        default: false
    }
  },
  methods: {
      cargaVuelo: function () {
          this.showMenuABM = false,
          this.showABMVuelo = true,
          this.showABMAlojamiento = false,
          this.showABMActividad = false,
          this.showABMDestino = false,
          this.showABMPaquete = false,
          this.showABMUsuario = false
      },
      cargaAlojamiento: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = true,
          this.showABMActividad = false,
          this.showABMDestino = false,
          this.showABMPaquete = false,
          this.showABMUsuario = false        
      },
      cargaMenu: function () {
          this.showMenuABM = true,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false,
          this.showABMActividad = false,
          this.showABMDestino = false,
          this.showABMPaquete = false,
          this.showABMUsuario = false
      },
      cargaActividad: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false,
          this.showABMActividad = true,
          this.showABMDestino = false,
          this.showABMPaquete = false,
          this.showABMUsuario = false
      },
      cargaDestino: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false,
          this.showABMActividad = false,
          this.showABMDestino = true,
          this.showABMPaquete = false,
          this.showABMUsuario = false
      },
      cargaPaquete: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false,
          this.showABMActividad = false,
          this.showABMDestino = false,
          this.showABMPaquete = true,
          this.showABMUsuario = false
      },
       cargaUsuario: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false,
          this.showABMActividad = false,
          this.showABMDestino = false,
          this.showABMPaquete = false,
          this.showABMUsuario = true
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.options {
    margin: auto;
}
.border-top { 
    border-top: 1px solid #e5e5e5; 
}
.border-bottom { 
    border-bottom: 1px solid #e5e5e5; 
}
.border-top-gray { 
    border-top-color: #adb5bd; 
}
.box-shadow { 
    box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); 
}
.lh-condensed { 
    line-height: 1.25; 
}

.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}
</style>