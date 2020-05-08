<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Destinos</h4>
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
              <button @click="cargaEdit(destino)">
                <i class="fas fa-edit"></i>
              </button>
            </td>
          </tr>       
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
        <h4 class="mb-3">Ingrese los datos del Destino</h4>              
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="firstName">País</label>
                <input type="text" class="form-control" id="firstName"  v-model="pais" required>
                <label for="firstName">Región</label>
                <input type="text" class="form-control" id="firstName" v-model="region" required>
                <label for="firstName">Ciudad</label>
                <input type="text" class="form-control" id="firstName" v-model="ciudad" required>
                <br>
                <button @click="submit" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
            <button @click="cargaLista" type="button" class="btn btn-lg btn-block btn-primary options text-center">Cancelar</button> 
        </div>             
    </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModificacionAlojamiento",
  props: {
    showList: {
        type: Boolean,
        default: true
    },
    deleteElement: {
        type: Boolean,
        default: false
    },
    destinos:null,
    destinoSeleccionado:null,
    pais:null,
    region:null,
    ciudad:null,
    destino_to_modify_id:null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      return true;
    },
    cargaEdit: function (destino) {
      this.pais=destino.pais,
      this.region=destino.region,
      this.ciudad=destino.ciudad,
      this.destino_to_modify_id = destino.id;
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function () {
        this.$axios
        .get('https://localhost:57935/api/destino')
        .then(response => (this.destinos = response.data));
      (this.showList = true), (this.editElement = false);
    },
    submit() {
      if(this.validar()){
        this.$axios
        .put('https://localhost:57935/api/destino/'+this.destino_to_modify_id, {
         id:this.destino_to_modify_id,
         pais:this.pais,
         region:this.region,
         ciudad:this.ciudad
        }).then( () => this.cargaLista())
      }
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
</style>