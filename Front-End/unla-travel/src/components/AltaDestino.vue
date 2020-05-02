<template>
<div class="text-center">
    <h4 class="mb-3">Ingrese datos de Destino</h4>              
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="firstName">País</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Región</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Ciudad</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <br>
                <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
            <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary options text-center">Volver Al Menú</button> 
        </div>             
    </div>
</div>
</template>

<script>
export default {
  name: 'AltaDestino',
  props: {
    msg: String,
    info: null
  },
  methods: {
    volver(){
        this.$parent.cargaMenu();
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
</style>