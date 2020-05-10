<template>
  <div class="text-center">
    <h4 class="mb-3">ABM Vuelos</h4>
    <div class="row">
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label for="fecha-desde">Fecha Desde</label>
              <input
                type="text"
                class="form-control"
                id="fecha-desde"
                placeholder="aaaa/mm/dd HH:MM"
                value
                v-model="fechaDesde"
                required
              />
              <p v-if="fechaDesdeAlert" class="color-red"> {{fechaDesdeMessage}} </p>

              <label for="fecha-hasta">Fecha Hasta</label>
              <input
                type="text"
                class="form-control"
                id="fecha-hasta"
                placeholder="aaaa/mm/dd HH:MM"
                value
                v-model="fechaHasta"
                required
              />
              <p v-if="fechaHastaAlert" class="color-red"> {{fechaHastaMessage}} </p>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Origen</label>
                <select v-model="origen" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="destino in destinos" :key="destino.id">{{destino.id}}</option>
                </select>
              </div>
              <p v-if="origenAlert" class="color-red"> {{origenMessage}} </p>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Destino</label>
                <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="destino in destinos" :key="destino.id">{{destino.id}}</option>
                </select>
              </div>
              <p v-if="destinoAlert" class="color-red"> {{destinoMessage}} </p>

              <label for="destino">Clase</label>
              <input
                type="text"
                class="form-control"
                id="destino"
                placeholder
                value
                v-model="clase"
                required
              />
              <p v-if="claseAlert" class="color-red"> {{claseMessage}} </p>

              <label for="valoracion">Valoración</label>
              <input
                type="text"
                class="form-control"
                id="valoracion"
                placeholder="1-5"
                value
                v-model="valoracion"
                required
              />
              <p v-if="valoracionAlert" class="color-red"> {{valoracionMessage}} </p>

              <hr class="mb-4" />
              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  id="ida-vuelta"
                  v-model="idaVuelta"
                />
                <label class="custom-control-label" for="ida-vuelta">Ida y Vuelta</label>
              </div>

              <hr class="mb-4" />
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="escala" v-model="escala" />
                <label class="custom-control-label" for="escala">Con Escala</label>
              </div>

              <hr class="mb-4" />
              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  class="custom-control-input"
                  id="acceso-discapacitados"
                  v-model="discapacitados"
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
  name: "AltaVuelo",
  props: {
    fechaDesde: null,
    horaDesde: null,
    fechaHasta: null,
    horaHasta: null,
    origen: null,
    destino: null,
    clase: null,
    valoracion: null,
    idaVuelta: null,
    escala: null,
    discapacitados: null,

    destinos: null,

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

    origenAlert: {
      type: Boolean,
      default: false
    },
    origenMessage: null,

    destinoAlert: {
      type: Boolean,
      default: false
    },
    destinoMessage: null,

    claseAlert: {
      type: Boolean,
      default: false
    },
    claseMessage: null,

    valoracionAlert: {
      type: Boolean,
      default: false
    },
    valoracionMessage: null
  },
  isValid: null,
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid = true;
      
      if(!this.fechaDesde){
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Ingrese una fecha";
        this.isValid = false;
      }else{this.fechaDesdeAlert = false;}
      
      if(!this.fechaHasta){
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Ingrese una fecha";
        this.isValid = false;
      }else{this.fechaHastaAlert = false;}

      if(!this.origen){
        this.origenAlert = true;
        this.origenMessage = "Seleccione un origen";
        this.isValid = false;
      }else{this.origenAlert = false;}

      if(!this.destino){
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      }else{this.destinoAlert = false;}

      if(!this.valoracion){
        this.valoracionAlert = true;
        this.valoracionMessage = "Seleccione un destino";
        this.isValid = false;
      }else{this.valoracionAlert = false;}

      if(!this.clase){
        this.claseAlert = true;
        this.claseMessage = "Ingrese una clase";
        this.isValid = false;
      }else{this.claseAlert = false;}

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .post("https://localhost:57935/api/vuelo", {
            fechaida: this.fechaDesde ,
            fechavuelta: this.fechaHasta,
            origen: this.origen,
            destino: this.destino,
            idavuelta: this.idaVuelta,
            valoracion: this.valoracion,
            clase: this.clase,
            conescala: this.escala,
            accesodiscapacitados: this.discapacitados
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