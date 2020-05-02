<template>
<div class="text-center">
          <h4 class="mb-3">Ingrese datos de Vuelo</h4>
          <form class="needs-validation" novalidate>
            <div class="row options">
              <div>            
               <label for="fecha-desde">Fecha Desde</label>
                <input type="text" class="form-control" id="fecha-desde" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-desde" placeholder="HH:MM" value="" required>
                
                <label for="fecha-hasta">Fecha Hasta</label>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="HH:MM" value="" required>
                
                <label for="origen">Origen</label>
                <input type="text" class="form-control" id="origen" placeholder="" value="" required>
                
                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" required>
                
                <label for="destino">Clase</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" required>

                <label for="valoracion">Valoración</label>
                <input type="text" class="form-control" id="valoracion" placeholder="1-5" value="" required>
               

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="ida-vuelta">
                <label class="custom-control-label" for="ida-vuelta">Ida y Vuelta</label>
                </div>

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="escala">
                <label class="custom-control-label" for="escala">Con Escala</label>
                </div>

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
          <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>               
        </div>
</template>

<script>
export default {
  name: 'AltaVuelo',
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