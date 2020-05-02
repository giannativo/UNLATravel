<template>
<div class="text-center">
    <h4 class="mb-3">ABM Alojamiento</h4>
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div> 
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="" value="" required>           
                
                <label for="tipo-servicio">Tipo de Servicio</label>
                <input type="text" class="form-control" id="tipo-servicio" placeholder="" value="" required>
                                
                <label for="tipo-habitacion">Tipo Habitación</label>
                <input type="text" class="form-control" id="tipo-habitacion" placeholder="" value="" required>
                
                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" required>
                
                <label for="valoracion">Cantidad Estrellas</label>
                <input type="text" class="form-control" id="valoracion" placeholder="1-5" value="" required>

                <label for="tipo-alojamiento">Tipo Alojamiento</label>
                <input type="text" class="form-control" id="tipo-alojamiento" placeholder="" value="" required>

                <label for="tipo-regimen">Tipo Régimen</label>
                <input type="text" class="form-control" id="tipo-regimen" placeholder="" value="" required>
               

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="acceso-discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>



                
                <br>

                <button type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
                 
                
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
  name: 'AltaAlojamiento',
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