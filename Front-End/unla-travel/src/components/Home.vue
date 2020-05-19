<template>
 <div>
   <b-container class="bv-example-row" v-if="activeSearch">
  <b-row>
    <b-col>Vuelos</b-col>
    <b-col>Alojamientos</b-col>
    <b-col>Paquetes</b-col>
    <b-col>Actividades</b-col>
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
 </div>
</template>

<script>
import VistaVuelo from './VistaVuelo.vue'

export default {
  name: "Home",
  components: {
    VistaVuelo
  },
  props: {
    destinos: null,
    activeSearch: {
      type: Boolean,
      default: false
    },
    showVuelos: {
      type: Boolean,
      default: false
    }
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
  max-height: 300px;
}
</style>