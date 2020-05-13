<template>
  <div class="text-center">
    <h4 class="mb-3">ABM Actividades</h4>
    <div class="row">
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label for="titulo">Titulo</label>
              <input
                v-model="nombreActividad"
                type="text"
                class="form-control"
                id="titulo"
                placeholder
                value
                required
              />
              <p v-if="tituloAlert" class="color-red"> {{tituloMessage}} </p>
              <label for="fecha-desde">Fecha Desde</label>
              <input
                type="text"
                class="form-control"
                id="fecha-desde"
                placeholder="aaaa/mm/dd HH:MM"
                value
                required
                v-model="fechaDesde"
              />
              <p v-if="fechaDesdeAlert" class="color-red"> {{fechaDesdeMessage}} </p>

              <label for="fecha-hasta">Fecha Hasta</label>
              <input
                type="text"
                class="form-control"
                id="fecha-hasta"
                placeholder="aaaa/mm/dd HH:MM"
                value
                required
                v-model="fechaHasta"
              />
              <p v-if="fechaHastaAlert" class="color-red"> {{fechaHastaMessage}} </p>
              
              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Destino</label>
                <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="destino in destinos" :key="destino.id">{{destino.id}}</option>
                  
                </select>
              </div>
              <p v-if="destinoAlert" class="color-red"> {{destinoMessage}} </p>

              <label for="descripcion">Descripción</label>
              <input
                v-model="descripcion"
                type="text"
                class="form-control"
                id="descripcion"
                placeholder
                value
                required
              />
              <p v-if="descripcionAlert" class="color-red"> {{descripcionMessage}} </p>
 
              <label for="franja-horaria">Franja Horaria</label>
              <input
                v-model="franjaHoraria"
                type="text"
                class="form-control"
                id="franja-horaria"
                placeholder
                value
                required
              />
              <p v-if="franjaAlert" class="color-red"> {{franjaMessage}} </p>

             
              


              <label for="valoracion">Valoración</label>
              <input
                v-model="valoracion"
                type="text"
                class="form-control"
                id="valoracion"
                placeholder="1-5"
                value
                required
              />
              <p v-if="valoracionAlert" class="color-red"> {{valoracionMessage}} </p>

              <hr class="mb-4" />
              <div class="custom-control custom-checkbox">
                <input
                  v-model="accesoDiscapacitados"
                  type="checkbox"
                  class="custom-control-input"
                  id="acceso-discapacitados"
                />
                <label
                  class="custom-control-label"
                  for="acceso-discapacitados"
                >Acceso a Discapacitados</label>
              </div>
              <br />
              <button
                @click="submit"
                type="button"
                class="btn btn-lg btn-block btn-primary"
              >Guardar Cambios</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <br />
    <div class="row">
      <div class="options text-center">
        <button
          @click="volver"
          type="button"
          class="btn btn-lg btn-block btn-primary options text-center"
        >Volver Al Menú</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AltaActividad",
  props: {
    accesoDiscapacitados: null,
    descripcion: null,
    destino: null,
    fechaDesde: null,
    fechaHasta: null,
    franjaHoraria: null,
    lugar: null,
    nombreActividad: null,
    valoracion: null,
    destinos: null,

    tituloAlert: {
      type: Boolean,
      default: false
    },
    tituloMessage: null,
    
    fechaDesdeAlert: {
      type: Boolean,
      default: false
    },
    fechaDesdeMessage: null,

    fechaHastaAlert: {
      type: Boolean,
      default: false
    },
    fechaHastaMessage: null,

    destinoAlert: {
      type: Boolean,
      default: false
    },
    destinoMessage: null,

    descripcionAlert: {
      type: Boolean,
      default: false
    },
    descripcionMessage: null,

    lugarAlert: {
      type: Boolean,
      default: false
    },
    lugarMessage: null,

    franjaAlert: {
      type: Boolean,
      default: false
    },
    franjaMessage: null,

    valoracionAlert: {
      type: Boolean,
      default: false
    },
    valoracionMessage: null,
    isValid: null
  
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid =true;
      if(!this.nombreActividad){
        this.tituloAlert = true;
        this.tituloMessage = "Ingrese un Título"
        this.isValid = false;
      }else{this.tituloAlert = true;}

      if(!this.descripcion){
        this.descripcionAlert = true;
        this.descripcionMessage = "Ingrese un mensaje";
        this.isValid = false;
      }else{this.descripcionAlert = true;}

      if(!this.destino){
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      }else{this.destinoAlert = true;}

      if(!this.fechaDesde){
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      }else{this.fechaDesdeAlert = true;}

      if(!this.fechaHasta){
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      }else{this.fechaHastaAlert = true;}

      if(!this.franjaHoraria){
        this.franjaAlert = true;
        this.franjaMessage = "Ingrese una franja horaria";
        this.isValid = false;
      }else{this.franjaAlert = true;}

      
      if(!this.valoracion){
        this.valoracionAlert = true;
        this.valoracionMessage = "Ingrese una valoracion";
        this.isValid = false;
      }else{this.valoracionAlert = true;}

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .post("https://localhost:57935/api/actividad", {
            accesoDiscapacitados: this.accesoDiscapacitados,
            descripcion: this.descripcion,
            destino: this.destino,
            fechaDesde: this.fechaDesde,
            fechaHasta: this.fechaHasta,
            franjaHoraria: this.franjaHoraria,
            
            nombreActividad: this.nombreActividad,
            valoracion: this.valoracion
          })
          .then(this.volver());
      }
    }
  },
  mounted() {
    this.$axios
          .get("https://localhost:57935/api/destino")
          .then(response => (this.destinos = response.data));
  }
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
</style>