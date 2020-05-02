<template>
<div class="text-center">
    <h4 class="mb-3">Ingrese datos de Paquete</h4>              
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="firstName">Tipo Paquete</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Destino</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Fecha de Ida</label>
                <input type="text" class="form-control" id="fecha-desde" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-desde" placeholder="HH:MM" value="" required>
                <label for="firstName">Fecha de Vuelta</label>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="HH:MM" value="" required>
                <label for="firstName">Alojamiento</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Vuelo</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Actividad</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Cantidad de Personas</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Habitaciones</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="acceso-discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>
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
  name: 'AltaPaquete',
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