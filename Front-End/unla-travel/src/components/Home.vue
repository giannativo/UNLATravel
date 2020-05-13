<template>
 <div class="my-3 p-3 rounded container">
        <div class="my-3 p-3 rounded">   
        <div class="form-group">       
          <label for="exampleFormControlSelect1">Seleccione un Destino</label>
          <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
            <option v-for="destino in destinos" :key="destino.id" :value="destino.id">{{destino.ciudad}}, {{destino.region}}, {{destino.pais}}</option>
          </select>
        </div>
        <button type="button" class="btn btn-lg btn-block btn-primary">Buscar</button>
      </div>
 </div>
</template>

<script>
export default {
  name: "Home",
  props: {
    destinos: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
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
    }
  },
  mounted() {
    this.init();
  },
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
</style>