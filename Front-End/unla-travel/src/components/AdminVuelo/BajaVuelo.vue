<template>
  <div>
    <div class="text-center" v-if="showList">
      <h4 class="mb-3">Lista de Vuelos</h4>
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
      <br>
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
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="vuelo in vuelos" :key="vuelo.id">
            <th scope="row">{{vuelo.id}}</th>
            <td>{{vuelo.fechaIda}}</td>
            <td>{{vuelo.fechaVuelta}}</td>
            <td>{{vuelo.origen.ciudad}}, {{vuelo.origen.region}}, {{vuelo.origen.pais}} </td>
            <td>{{vuelo.destino.ciudad}}, {{vuelo.destino.region}}, {{vuelo.destino.pais}} </td>
            <td>{{vuelo.clase}}</td>
            <td>{{vuelo.valoracionAereolinea}}</td>
            <td>{{vuelo.idaVuelta}}</td>
            <td>{{vuelo.conEscala}}</td>
            <td>{{vuelo.accesoDiscapacitados}}</td>
            <td>
              <button @click="cargaDelete(vuelo.id)">
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
      <button @click="deleteVuelo" type="button" class="btn options btn-lg btn-block btn-success">Si</button>
      <button @click="cargaLista" type="button" class="btn options btn-lg btn-block btn-danger">No</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "BajaVuelo",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    deleteElement: {
      type: Boolean,
      default: false
    },
    vuelos: [],
    vuelo: null,
    vuelo_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaDelete: function(vuelo_id) {
      (this.showList = false), (this.deleteElement = true);
      this.vuelo_to_delete_id = vuelo_id;
    },
    cargaLista: function() {
      this.$axios
        .get("https://localhost:57935/api/vuelo")
        .then(response => (this.vuelos = response.data));

      (this.showList = true), (this.deleteElement = false);
    },
    deleteVuelo() {
      this.$axios
        .delete("https://localhost:57935/api/vuelo/" + this.vuelo_to_delete_id)
        .then(() => {this.cargaLista();}).catch(() => {alert("El vuelo tiene dependencias. Elimine las dependencias para continuar");});
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
.btn {
  width: 200px;
}
.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}
</style>