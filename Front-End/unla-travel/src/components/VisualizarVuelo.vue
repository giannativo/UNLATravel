<template>
  <div class="text-center">
    <h4 class="mb-3">Lista Vuelos</h4>
    <form class="needs-validation" novalidate>
      <div class="row options">
        <div>
          <label for="id-vuelo">Ingrese ID Vuelo</label>
          <input
            type="text"
            class="form-control"
            id="id-vuelo"
            placeholder="ID Vuelo"
            value
            required
            @input="init"
            v-model="vuelo"
          />
        </div>
      </div>
    </form>
    <br />
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Fecha Desde</th>
          <th scope="col">Fecha Hasta</th>
          <th scope="col">Origen</th>
          <th scope="col">Destino</th>
          <th scope="col">Clase</th>
          <th scope="col">Valoracion</th>
          <th scope="col">Ida y Vuelta</th>
          <th scope="col">Con Escala</th>
          <th scope="col">Acceso a Discapacitados</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="vuelo in vuelos" :key="vuelo.id">
          <th scope="row">{{vuelo.id}}</th>
          <td>{{vuelo.fechaIda | moment("DD/MM/YYYY LT")}}</td>
          <td>{{vuelo.fechaVuelta | moment("DD/MM/YYYY LT")}}</td>
          <td>{{vuelo.origen}}</td>
          <td>{{vuelo.destino}}</td>
          <td>{{vuelo.clase}}</td>
          <td>{{vuelo.valoracionAereolinea}}</td>
          <td>{{vuelo.idaVuelta}}</td>
          <td>{{vuelo.conEscala}}</td>
          <td>{{vuelo.accesoDiscapacitados}}</td>
        </tr>
      </tbody>
    </table>
    <br />
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
  </div>
</template>

<script>
export default {
  name: "VisualizarVuelo",
  props: {
    vuelos: [],
    vuelo: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    init() {
      if (!this.vuelo) {
        this.$axios
          .get("https://localhost:57935/api/vuelo")
          .then(response => (this.vuelos = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/vuelo/" + this.vuelo)
          .then(response => (this.vuelos = [response.data]));
      }
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
</style>