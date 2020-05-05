<template>
<div class="text-center">
    <h4 class="mb-3">Ingrese datos de Destino</h4>              
    <div class="row">
        <div class="options text-center">
         <form @submit.prevent="submit()" class="needs-validation" novalidate>
          
            <div class="row options">
              <div>
                <label for="firstName">País 
                  
                </label>
                <input type="text" v-model="pais" class="form-control" id="pais" placeholder="" value="" required>
                <p v-if="paisAlert" class="color-red"> Ingrese un pais </p>
                <label for="firstName">Región</label>
                <input type="text" v-model="region" class="form-control" id="region" placeholder="" value="" required>
                <p v-if="regionAlert" class="color-red"> Ingrese una region </p>
                <label for="firstName">Ciudad</label>
                <input type="text" v-model="ciudad" class="form-control" id="ciudad" placeholder="" value="" required>
                <p v-if="ciudadAlert" class="color-red"> Ingrese una ciudad </p>
                <br>
                <button @click="validar" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
            <button @click="volver" type="submit" class="btn btn-lg btn-block btn-primary options text-center">Volver Al Menú</button> 
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

    paisAlert: {
      type: Boolean,
      default: false
    },
    regionAlert: {
      type: Boolean,
      default: false
    },
    ciudadAlert: {
      type: Boolean,
      default: false
    }


  },
  methods: {
    volver(){
        this.$parent.cargaMenu();
    },
    validar(){
         if(!this.pais){
           this.paisAlert=true;
         }else{
           this.paisAlert=false;
         }
         if(!this.region){
           this.regionAlert=true;
         }else{
           this.regionAlert=false;
         }
         if(!this.ciudad){
           this.ciudadAlert=true;
         }else{
           this.ciudadAlert=false;
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

</style>