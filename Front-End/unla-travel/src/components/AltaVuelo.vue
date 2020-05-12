<template>
<div class="text-center">
    <h4 class="mb-3">ABM Vuelos</h4>
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>            
               <label for="fecha-desde">Fecha Desde</label>
                <datetime input-class="form-control" format="yyyy/MM/dd T" type="datetime" id="fecha-desde" placeholder="aaaa/mm/dd HH:MM" v-model="fechaDesde" required></datetime>                
                
                <label for="fecha-hasta">Fecha Hasta</label>
                <datetime input-class="form-control" format="yyyy/MM/dd T" type="datetime" id="fecha-hasta" placeholder="aaaa/mm/dd HH:MM" v-model="fechaHasta" required></datetime>                                
                
                <label for="origen">Origen</label>
                <input type="text" class="form-control" id="origen" placeholder="" value="" v-model="origen" required>
                
                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" v-model="destino" required>
                
                <label for="destino">Clase</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" v-model="clase" required>

                <label for="valoracion">Valoración</label>
                <input type="text" class="form-control" id="valoracion" placeholder="1-5" value="" v-model="valoracion" required>
               

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="ida-vuelta" v-model="idaVuelta">
                <label class="custom-control-label" for="ida-vuelta">Ida y Vuelta</label>
                </div>

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="escala" v-model="escala">
                <label class="custom-control-label" for="escala">Con Escala</label>
                </div>

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="acceso-discapacitados" v-model="discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
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
  name: 'AltaVuelo',
  props: {
    fechaDesde: null,
    fechaHasta: null,
    origen: null,
    destino: null,
    clase: null,
    valoracion: null,
    idaVuelta: null,
    escala: null,
    discapacitados: null
  },
  methods: {
    volver(){
        this.$parent.cargaMenu();
    },
    validar(){
       return true;
    },
     submit() {
      if(this.validar()){
        this.$axios
        .post('https://localhost:57935/api/vuelo', {
          fechaida: this.fechaDesde,
          fechavuelta: this.fechaHasta,
          origen: this.origen,
          destino: this.destino,
          idavuelta: this.idaVuelta,
          valoracion: this.valoracion,
          clase: this.clase,
          conescala: this.escala,
          accesodiscapacitados: this.discapacitados
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