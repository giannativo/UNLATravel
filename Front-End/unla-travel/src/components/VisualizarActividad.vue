<template>
  <div class="text-center">
    
      <h4 class="mb-3">Lista Actividades</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Actividad</label>
            <input
              type="text"
              class="form-control"
              id="id-actividad"
              placeholder="ID Actividad"
              value
              required
              @input="init"
              v-model="actividad"
            />
          </div>
        </div>
        <br />
      </form>
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Titulo</th>
            <th scope="col">Fecha Desde</th>
            <th scope="col">Fecha Hasta</th>
            <th scope="col">Destino</th>
            <th scope="col">Descripcion</th>
            <th scope="col">Franja Horaria</th>
            <th scope="col">Lugar</th>
            <th scope="col">Valoracion</th>
            <th scope="col">Acceso a Discapacitados</th>
            
            
          </tr>
        </thead>
        <tbody>
        <tr v-for="actividad in actividades" :key="actividad.id">
          <th scope="row">{{actividad.id}}</th>
          <td>{{actividad.nombreActividad}}</td>
          <td>{{actividad.fechaDesde}}</td>
          <td>{{actividad.fechaHasta}}</td>
          <td>{{actividad.destino}}</td>
          <td>{{actividad.descripcion}}</td>
          <td>{{actividad.franjaHoraria}}</td>
          <td>{{actividad.lugar}}</td>
          <td>{{actividad.valoracion}}</td>
          <td>{{actividad.accesoDiscapacitados}}</td>
          
          
        </tr>
      </tbody>
      </table>
      <br />
      <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    
  </div>
</template>

<script>
export default {
  name: "VisualizarActividad",
  props: {
    actividades: null,
    actividad: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    init() {
      if (!this.actividad) {
        this.$axios
          .get("https://localhost:57935/api/actividad")
          .then(response => (this.actividades = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/actividad/" + this.actividad)
          .then(response => (this.actividades = [response.data]));
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