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
    <button @click="volver" type="button" class="btn options btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
     <div class="row">
        <div class="options text-center">
         <form @submit.prevent="submit()" class="needs-validation" novalidate>
          
            <div class="row options">
              <div>
                <label for="firstName">País 
                  
                </label>
                <input type="text" v-model="pais" class="form-control" id="pais" placeholder="" value="" required>
                <div v-if="paisAlert" class="alert alert-danger" role="alert">{{paisMessage}}</div>
                <label for="firstName">Región</label>
                <input type="text" v-model="region" class="form-control" id="region" placeholder="" value="" required>
                <div v-if="regionAlert" class="alert alert-danger" role="alert">{{regionMessage}}</div>
                <label for="firstName">Ciudad</label>
                <input type="text" v-model="ciudad" class="form-control" id="ciudad" placeholder="" value="" required>
                <div v-if="ciudadAlert" class="alert alert-danger" role="alert">{{ciudadMessage}}</div>
                <br>
                <button @click="submit" type="button" class="btn btn-lg btn-block btn-success options button-submit">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
        <button @click="volver" type="submit" class="btn btn-lg btn-block btn-danger options text-center">Volver Al Menú</button>
        <br> 
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
    
    paisAlert: {
      type: Boolean,
      default: false
    }, paisMessage: null,
    regionAlert: {
      type: Boolean,
      default: false
    }, regionMessage: null,
    ciudadAlert: {
      type: Boolean,
      default: false
    },ciudadMessage: null,
    isValid: null,
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
      validar(){
         this.isValid = true;
         if(!this.pais){
           this.paisAlert=true;
           this.isValid = false;
           this.paisMessage = "Ingrese un pais";
         }else{
           this.paisAlert=false;
         }
         if(!this.region){
           this.regionAlert=true;
           this.isValid = false;
           this.regionMessage = "Ingrese una región";
         }else{
           this.regionAlert=false;
         }
         if(!this.ciudad){
           this.ciudadAlert=true;
           this.isValid = false;
           this.ciudadMessage = "Ingrese una ciudad";
         }else{
           this.ciudadAlert=false;
         }
         return this.isValid;
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
.color-red{
  color: red;
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