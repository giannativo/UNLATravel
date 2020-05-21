<template>
 <div>
   <b-container class="bv-example-row" v-if="activeSearch">
  <b-row>
    <b-col>
      <button @click="cargaVuelos" class="btn btn-primary"><i class="fas fa-plane"></i> Vuelos</button>
    </b-col>
    <b-col>
      <button @click="cargaAlojamientos" class="btn btn-primary"><i class="fas fa-hotel"></i> Alojamientos</button>
    </b-col>
    <b-col>
      <button @click="cargaPaquetes" class="btn btn-primary"><i class="fas fa-suitcase-rolling"></i> Paquetes</button>
    </b-col>
    <b-col>
      <button @click="cargaActividades" class="btn btn-primary"><i class="fas fa-skiing"></i> Actividades</button>
    </b-col>
  </b-row>
</b-container>
        <div class="my-3 p-3 rounded container" v-if="!activeSearch">   
        <div class="form-group">       
          <label for="exampleFormControlSelect1">Seleccione un Destino</label>
          <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
            <option v-for="destino in destinos" :key="destino.id" :value="destino.id">{{destino.ciudad}}, {{destino.region}}, {{destino.pais}}</option>
          </select>
        </div>
        <button @click="search()" type="button" class="btn btn-lg btn-block btn-primary">Buscar</button>
      </div>
      <VistaVuelo v-if="showVuelos"/>
      <VistaAlojamiento v-if="showAlojamientos"/>
      <VistaPaquete v-if="showPaquetes"/>
      <VistaActividad v-if="showActividades"/>
 </div>
</template>

<script>
import VistaVuelo from './VistaVuelo.vue'
import VistaAlojamiento from './VistaAlojamiento.vue'
import VistaPaquete from './VistaPaquete.vue'
import VistaActividad from './VistaActividad.vue'

export default {
  name: "Home",
  components: {
    VistaVuelo,
    VistaAlojamiento,
    VistaPaquete,
    VistaActividad
  },
  props: {
    destinos: null,
    destino: null,
    activeSearch: {
      type: Boolean,
      default: false
    },
    showVuelos: {
      type: Boolean,
      default: false
    },
    showAlojamientos: {
      type: Boolean,
      default: false
    },
    showPaquetes: {
      type: Boolean,
      default: false
    },
    showActividades: {
      type: Boolean,
      default: false
    },
    current_destino: null
  },
  methods: {
    init() {
      if (!this.destinoSeleccionado) {
        this.$axios
          .get("https://localhost:57935/api/destino")
          .then(response => (this.destinos = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/destino/" + this.destinoSeleccionado)
          .then(response => (this.destinos = [response.data]));
      }
    },
    search(){
      
      this.activeSearch = true;
      this.showVuelos = true;
    },
    cargaVuelos(){
      this.showVuelos = true;
      this.showAlojamientos = false;
      this.showPaquetes = false;
      this.showActividades = false;
    },
    cargaAlojamientos(){
      this.showVuelos = false;
      this.showAlojamientos = true;
      this.showPaquetes = false;
      this.showActividades = false;
    },
    cargaPaquetes(){
      this.showVuelos = false;
      this.showAlojamientos = false;
      this.showPaquetes = true;
      this.showActividades = false;
    },
    cargaActividades(){
      this.showVuelos = false;
      this.showAlojamientos = false;
      this.showPaquetes = false;
      this.showActividades = true;
    }
  },
  mounted() {
    this.init();
  }
};
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
  box-shadow: 0 0.25rem 0.75rem rgba(0, 0, 0, 0.05);
}
.lh-condensed {
  line-height: 1.25;
}
.color-red{
  color: red;
}
.bv-example-row{
  color: white;
}
.fas{
  color: white;
}
.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}
</style>