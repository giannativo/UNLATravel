<template>
  <div>
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Destinos</h4>
    <div v-show="!errorDependencia" class="alert alert-danger" role="alert">
         El destino tiene dependencias. Elimine las dependencias para continuar
          </div>
    <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID de destino</label>
            <input
              type="text"
              class="form-control"
              id="id-destino"
              placeholder="ID Destino"
              @input="init"
              v-model="destinoSeleccionado"
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
          <th scope="col">Pais</th>
          <th scope="col">Region</th>
          <th scope="col">Ciudad</th>
          <th scope="col">Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="destino in destinos" :key="destino.id">
            <th scope="row">{{ destino.id }}</th>
            <td>{{ destino.pais }}</td>
            <td>{{ destino.region }}</td>
            <td>{{ destino.ciudad }}</td>     
            <td>
              <button @click="cargaDelete(destino.id)">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>       
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn options btn-lg btn-block btn-primary">Volver Al Menú</button>
    <br>
    </div>
    <div v-if="deleteElement">
        <p>Desea eliminar este elemento?</p>
        <button @click="deleteDestino" type="button" class="btn options btn-lg btn-block btn-success">Si</button>
        <button @click="cargaLista" type="button" class="btn options btn-lg btn-block btn-danger">No</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "BajaDestino",
  props: {
    showList: {
        type: Boolean,
        default: true
    },
    deleteElement: {
        type: Boolean,
        default: false
    },
    errorDependencia:{
      type:Boolean,
      default:true
    },
    destinos:null,
    destinoSeleccionado: null,
    destino_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaDelete: function(destino_id) {
      (this.showList = false), (this.deleteElement = true);
      this.destino_to_delete_id = destino_id;
    },
    cargaLista: function () {
        this.$axios
        .get('https://localhost:57935/api/destino')
        .then(response => (this.destinos = response.data));
      (this.showList = true), (this.deleteElement = false);
    },    
    deleteDestino() {
      this.$axios.delete('https://localhost:57935/api/destino/'+this.destino_to_delete_id)
      .then(() => {this.cargaLista();}).catch(() => {
              this.errorDependencia = false;
               setTimeout(() => this.errorDependencia = true, 2000)
        //alert("El destino tiene dependencias. Elimine las dependencias para continuar");
        });
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