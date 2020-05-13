<template>
  <div>
    <div>
      <h4 class="mb-3">Lista de Alojamientos</h4>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Alojamiento</label>
            <input
              type="number"
              class="form-control"
              id="id-alojamiento"
              placeholder="ID Alojamiento"
              @input="init"
              v-model="alojamiento_search_id"
            />
          </div>
        </div>
      <br />
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Nombre</th>
            <th scope="col">Tipo de Servicio</th>
            <th scope="col">Tipo Habitación</th>
            <th scope="col">Destino</th>
            <th scope="col">Cantidad Estrellas</th>
            <th scope="col">Tipo Alojamiento</th>
            <th scope="col">Tipo Régimen</th>
            <th scope="col">Acceso a Discapacitados</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="place in places" :key="place.id">
            <th scope="row">{{ place.id }}</th>
            <td>{{ place.nombreAlojamiento }}</td>
            <td>{{ place.tipoServicio }}</td>
            <td>{{ place.tipoHabitacion }}</td>
            <td>{{ place.destino.ciudad}}, {{place.destino.region}}, {{place.destino.pais}}</td>
            <td>{{ place.cantidadEstrellas }}</td>
            <td>{{ place.tipoAlojamiento.descripcion }}</td>
          <td>{{ place.tipoRegimen.descripcion }}</td>
            <td>{{ place.accesoDiscapacitados }}</td>
          </tr>
        </tbody>
      </table>
      <br />
      <button @click="volver" type="button" class="btn options btn-lg btn-block btn-primary">Volver Al Menú</button>
      <br>
    </div>
  </div>
</template>

<script>
export default {
  name: "VisualizarAlojamiento",
  props: {
    places: null,
    alojamiento_search_id: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    init() {
      if (!this.alojamiento_search_id) {
        this.$axios
          .get("https://localhost:57935/api/alojamiento")
          .then(response => (this.places = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/alojamiento/" + this.alojamiento_search_id)
          .then(response => (this.places = [response.data]));
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
.btn {
  width: 200px;
}
.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}
</style>