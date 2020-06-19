<template>
  <div>
    <div class="text-center" v-if="showList">
      <h4 class="mb-3">Lista de Actividades</h4>
       <div v-show="!usuarioEliminado" class="alert alert-danger" role="alert">
        La actividad tiene dependencias. Elimine las dependencias para continuar
          </div>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Actividad</label>
            <input
              type="text"
              class="form-control"
              id="id-vuelo"
              placeholder="ID Actividad"
              @input="init"
              v-model="actividad"
              value
              required
            />
          </div>
        </div>
      </form>
      <br />
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Actividad</th>
            <th scope="col">Fecha Desde</th>
            <th scope="col">Fecha Hasta</th>
            <th scope="col">Destino</th>
            <th scope="col">Descripción</th>
            <th scope="col">Franja Horaria</th>
            <th scope="col">Valoracion</th>
            <th scope="col">Acceso Discapacitados</th>
            <th scope="col">Precio</th>
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
      <tr tr v-for="actividad in actividades" :key="actividad.id">
        <th scope="row">{{actividad.id}}</th>
          <td>{{actividad.nombreActividad}}</td>
          <td>{{actividad.fechaDesde}}</td>
          <td>{{actividad.fechaHasta}}</td>
          <td>{{actividad.destino.ciudad}}, {{actividad.destino.region}}, {{actividad.destino.pais}}</td>
          <td>{{actividad.descripcion}}</td>
          <td>{{actividad.franjaHoraria}}</td>
          
          <td>{{actividad.valoracion}}</td>
          <td>{{actividad.accesoDiscapacitados}}</td>
          <td>{{actividad.precio}}</td>
            <td>
              <button @click="cargaDelete(actividad.id)">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <br />

      <button @click="volver" type="button" class="btn options btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="deleteElement">
      <p>Desea eliminar este elemento?</p>
      <button @click="deleteUsuario" type="button" class="btn options btn-lg btn-block btn-success">Si</button>
      <button @click="cargaLista" type="button" class="btn options btn-lg btn-block btn-danger">No</button>
    </div>
    <br>
  </div>
</template>

<script>
export default {
  name: "BajaActividad",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    deleteElement: {
      type: Boolean,
      default: false
    },
    usuarioEliminado:{
      type:Boolean,
      default:true
    },
    actividades: null,
    actividad: null,
    actividad_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaDelete: function(actividad_id) {
      (this.showList = false), (this.deleteElement = true);
      this.actividad_to_delete_id = actividad_id;
    },
    cargaLista: function() {
      this.$axios
        .get('https://localhost:57935/api/actividad')
        .then(response => (this.actividades = response.data));
      (this.showList = true), (this.deleteElement = false);
    },
    deleteUsuario() {
      this.$axios.delete('https://localhost:57935/api/actividad/'+this.actividad_to_delete_id)
      .then(() => {this.cargaLista();}).catch(() => {
              this.reservaEliminada = false;
               setTimeout(() => this.reservaEliminada = true, 2000)
       // alert("La actividad tiene dependencias. Elimine las dependencias para continuar");
        });
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
    },
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
.btn {
  width: 200px;
}
.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}
</style>