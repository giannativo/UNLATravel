<template>
<div class="container bg-light">
    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="../assets/unlaLogo.jpg" alt="" width="72" height="72">  
    </div>
    <div class="text-center" v-if="showMenuABM">
        <div class="row">
            <div class="options text-center">                
                <button @click="cargaVuelo" type="button" class="btn btn-lg btn-block btn-primary">ABM Vuelos</button>
                <button @click="cargaAlojamiento" type="button" class="btn btn-lg btn-block btn-primary">ABM Alojamientos</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Actividades</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Paquetes</button>
                <button type="button" class="btn btn-lg btn-block btn-primary">ABM Administradores</button>
            </div>
        </div>
    </div>
    <ABMVuelo v-if="showABMVuelo"/>
    <ABMAlojamiento v-if="showABMAlojamiento"/>
</div>
</template>

<script>
import ABMVuelo from './ABMVuelo.vue'
import ABMAlojamiento from './ABMAlojamiento.vue'

export default {
  name: 'MenuAdmin',
  components: {
      ABMVuelo,
      ABMAlojamiento
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
    }
  },
  methods: {
      cargaVuelo: function () {
          this.showMenuABM = false,
          this.showABMVuelo = true,
          this.showABMAlojamiento = false
      },
      cargaAlojamiento: function () {
          this.showMenuABM = false,
          this.showABMVuelo = false,
          this.showABMAlojamiento = true
      },
      cargaMenu: function () {
          this.showMenuABM = true,
          this.showABMVuelo = false,
          this.showABMAlojamiento = false
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.container {
    max-width: 960px;
}
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
</style>