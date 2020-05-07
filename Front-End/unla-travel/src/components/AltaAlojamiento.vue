<template>
<div class="text-center">
    <h4 class="mb-3">Alta Alojamiento</h4>
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div> 
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" v-model="nombre" placeholder="" value="" required>           
                
                <label for="tipo-servicio">Tipo de Servicio</label>
                <input type="text" class="form-control" id="tipo_de_servicio" v-model="tipo_de_servicio" placeholder="" value="" required>
                                
                <label for="tipo-habitacion">Tipo Habitación</label>
                <input type="text" class="form-control" id="tipo_habitacion" v-model="tipo_habitacion" placeholder="" value="" required>
                
                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" v-model="destino" placeholder="" value="" required>
                
                <label for="valoracion">Cantidad Estrellas</label>
                <input type="number" class="form-control" id="estrellas" v-model="estrellas" placeholder="1-5" value="" required>

                <label for="tipo-alojamiento">Tipo Alojamiento</label>
                <input type="text" class="form-control" id="tipo_alojamiento" v-model="tipo_alojamiento" placeholder="" value="" required>

                <label for="tipo-regimen">Tipo Régimen</label>
                <input type="text" class="form-control" id="tipo_regimen" v-model="tipo_regimen" placeholder="" value="" required>

                <hr class="mb-4">
                <div>
                <input type="checkbox" v-model="acceso_a_discapacitados" id="acceso_a_discapacitados">
                <label for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>                
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
            <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary options text-center">Volver Al Menú</button> 
        </div>             
    </div>
    
    </div>
</template>

<script>
export default {
  name: 'AltaAlojamiento',
  props: {
    nombre: null,
    tipo_de_servicio: null,
    tipo_habitacion: null,
    destino: null,
    estrellas: null,
    tipo_alojamiento: null,
    tipo_regimen: null,
    acceso_a_discapacitados: null
  },
  methods: {
    volver(){
        this.$parent.cargaMenu();
    },
    validar() {
      return true;
    },
    submit() {
      if(this.validar()){
        this.$axios
        .post('https://localhost:57935/api/alojamiento', {
          nombreAlojamiento: this.nombre,
          tipoServicio: this.tipo_de_servicio,
          tipoHabitacion: this.tipo_habitacion,
          destino: this.destino,
          cantidadEstrellas: this.estrellas,
          tipoAlojamiento: this.tipo_alojamiento,
          tipoRegimen: this.tipo_regimen,
          accesoDiscapacitados: this.acceso_a_discapacitados
        }).then(this.volver())
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
</style>