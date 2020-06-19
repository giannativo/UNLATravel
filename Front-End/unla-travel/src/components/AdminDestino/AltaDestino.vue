<template>
<div class="text-center">
    <h4 class="mb-3">Ingrese datos de Destino</h4>              
    <div class="row">
       <div v-show="!destinoCreado" class="alert alert-danger" role="alert">
         El Destino no fue creado
          </div>
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
                <button @click="submit" type="button" class="btn btn-lg btn-block btn-success options">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
            <button @click="volver" type="submit" class="btn btn-lg btn-block btn-danger options text-center">Volver Al Menú</button> 
        </div>             
    </div>
</div>
</template>

<script>
export default {
  name: 'AltaDestino',
  props: {
    msg: String,
    info: null,
    errors: [],
    pais: null,
    region: null,
    ciudad: null,
    isValid: null,

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
    destinoCreado:{
      type:Boolean,
      default:true
    }


  },
  methods: {
    volver(){
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
    submit() {
      if(this.validar()){
        this.$axios
        .post('https://localhost:57935/api/destino', {
          pais: this.pais,
          region:this.region,
          ciudad:this.ciudad
         
        }).then(() => {this.volver();}).catch(() => {
              this.destinoCreado = false;
               setTimeout(() => this.destinoCreado = true, 2000)
              //alert("El Destino no fue creado");
          });
      }
    }
  }
}
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
    box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); 
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

</style>