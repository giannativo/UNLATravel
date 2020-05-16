<template>
  <div>
    <div v-if="showList">
      <h4 class="mb-3">Lista de Paquetes</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Paquete</label>
            <input
              type="text"
              class="form-control"
              id="id-vuelo"
              placeholder="ID Paquete"
              @input="init"
              v-model="paquete"
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
            <th scope="col">Tipo Paquete</th>
            <th scope="col">Destino</th>
            <th scope="col">Fecha de Ida</th>
            <th scope="col">Fecha de Vuelta</th>
            <th scope="col">Alojamiento</th>
            <th scope="col">Vuelo</th>
            <th scope="col">Actividad</th>
            <th scope="col">Cantidad de Personas</th>
            <th scope="col">Habitaciones</th>
            <th scope="col">Acceso a Discapacitados</th>
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="paquete in paquetes" :key="paquete.id">
            <th scope="row">{{paquete.id}}</th>
            <td>{{paquete.tipoPaquete}}</td>
            <td>{{paquete.destino.ciudad}}, {{paquete.destino.region}}, {{paquete.destino.pais}}</td>
            <td>{{paquete.fechaIda}}</td>
            <td>{{paquete.fechaVuelta}}</td>
            <td>{{paquete.alojamiento.nombreAlojamiento}}</td>
            <td>{{paquete.vuelo.id}}</td>
            <td>{{paquete.actividad.nombreActividad}}</td>
            <td>{{paquete.cantidadPersonas}}</td>
            <td>{{paquete.habitaciones}}</td>
            <td>{{paquete.accesoDiscapacitados}}</td>
            <td>
              <button @click="cargaDelete(paquete.id)">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <br />
      <button
        @click="volver"
        type="button"
        class="btn options btn-lg btn-block btn-primary"
      >Volver Al Menú</button>
      <br />
    </div>
    <div v-if="deleteElement">
      <p>Desea eliminar este elemento?</p>
      <button
        @click="deleteUsuario"
        type="button"
        class="btn options btn-lg btn-block btn-success"
      >Si</button>
      <button @click="cargaLista" type="button" class="btn options btn-lg btn-block btn-danger">No</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "BajaPaquete",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    deleteElement: {
      type: Boolean,
      default: false
    },
    paquete: null,
    paquetes: null,
    paquete_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaDelete: function(paquete_id) {
      (this.showList = false), (this.deleteElement = true);
      this.paquete_to_delete_id = paquete_id;
    },
    cargaLista: function() {
      this.$axios
        .get("https://localhost:57935/api/paquete")
        .then(response => (this.paquetes = response.data));
      (this.showList = true), (this.deleteElement = false);
    },
    deleteUsuario() {
      this.$axios
        .delete(
          "https://localhost:57935/api/paquete/" + this.paquete_to_delete_id
        )
        .then(() => this.cargaLista());
    },
    init() {
      if (!this.paquete) {
        this.$axios
          .get("https://localhost:57935/api/paquete")
          .then(response => (this.paquetes = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/paquete/" + this.paquete)
          .then(response => (this.paquetes = [response.data]));
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