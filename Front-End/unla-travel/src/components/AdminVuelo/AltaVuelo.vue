<template>
  <div class="text-center">
    <h4 class="mb-3">Alta Vuelo</h4>
    <div class="row">
      <div v-show="!vueloCreado" class="alert alert-danger" role="alert">
         El vuelo no fue creado
          </div>
      <div class="options text-center">
        <form class="needs-validation">
          <div class="row options">
            <div>
              <label for="fecha-desde">Fecha Desde</label>
              <datetime
                input-class="form-control"
                format="yyyy/MM/dd T"
                value-zone="UTC-3"
                :min-datetime="currentDate"
                zone="UTC-3"
                type="datetime"
                id="fecha-desde"
                placeholder="aaaa/mm/dd HH:MM"
                v-model="fechaDesde"
                required
              ></datetime>

              <div
                v-if="fechaDesdeAlert"
                class="alert alert-danger"
                role="alert"
              >{{fechaDesdeMessage}}</div>

              <label for="fecha-hasta">Fecha Hasta</label>
              <datetime
                input-class="form-control"
                format="yyyy/MM/dd T"
                value-zone="UTC-3"
                :min-datetime="fechaDesde"
                zone="UTC-3"
                type="datetime"
                id="fecha-hasta"
                placeholder="aaaa/mm/dd HH:MM"
                v-model="fechaHasta"
                required
              ></datetime>

              <div
                v-if="fechaHastaAlert"
                class="alert alert-danger"
                role="alert"
              >{{fechaHastaMessage}}</div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Origen</label>
                <select v-model="origen" class="form-control" id="exampleFormControlSelect1">
                  <option
                    v-for="destino in destinos"
                    :key="destino.id"
                    :value="destino.id"
                  >{{destino.ciudad}}, {{destino.region}}, {{destino.pais}}</option>
                </select>
                <div v-if="origenAlert" class="alert alert-danger" role="alert">{{origenMessage}}</div>
              </div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Destino</label>
                <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
                  <option
                    v-for="destino in destinos"
                    :key="destino.id"
                    :value="destino.id"
                  >{{destino.ciudad}}, {{destino.region}}, {{destino.pais}}</option>
                </select>
                <div v-if="destinoAlert" class="alert alert-danger" role="alert">{{destinoMessage}}</div>
              </div>

              <label for="destino">Clase</label>
              <input
                type="text"
                class="form-control"
                id="clase"
                placeholder
                value
                v-model="clase"
                required
              />
              <div v-if="claseAlert" class="alert alert-danger" role="alert">{{claseMessage}}</div>

              <label for="destino">Nombre Aereolinea</label>
              <input
                type="text"
                class="form-control"
                id="aerolinea"
                placeholder
                value
                v-model="aereolinea"
                required
              />
              <div
                v-if="aereolineaAlert"
                class="alert alert-danger"
                role="alert"
              >{{aereolineaMessage}}</div>

              <label for="valoracion">Valoración</label>
              <input
                type="number"
                class="form-control"
                id="valoracion"
                v-model="valoracion"
                placeholder="1-5"
                min="1"
                max="5"
                value
                required
              />
              <div
                v-if="valoracionAlert"
                class="alert alert-danger"
                role="alert"
              >{{valoracionMessage}}</div>
              <label for="precio">Precio</label>
              <input
                type="number"
                class="form-control"
                id="precio"
                v-model="precio"
                min="1"
                max="100000"
                value
                required
              />
              <div v-if="precioAlert" class="alert alert-danger" role="alert">{{precioMessage}}</div>

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
                class="btn btn-lg btn-block btn-success options"
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
          class="btn btn-lg btn-block btn-danger options text-center"
        >Volver Al Menú</button>
      </div>
    </div>
    <br />
  </div>
</template>

<script>
export default {
  name: "AltaVuelo",
  props: {
    fechaDesde: null,
    fechaHasta: null,
    origen: null,
    destino: null,
    clase: null,
    valoracion: null,
    idaVuelta: null,
    escala: null,
    discapacitados: null,
    destinos: null,
    aereolinea: null,
    precio: null,

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
    valoracionMessage: null,

    aereolineaAlert: {
      type: Boolean,
      default: false
    },
    aereolineaMessage: null,
    currentDate: null
  },
  precioAlert: {
    type: Boolean,
    default: false
  },
  vueloCreado:{
    type:Boolean,
    default:true
  },
  precioMessage: null,
  isValid: null,
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid = true;

      if (!this.fechaDesde) {
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Ingrese una fecha";
        this.isValid = false;
      } else {
        this.fechaDesdeAlert = false;
      }

      if (!this.fechaHasta) {
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Ingrese una fecha";
        this.isValid = false;
      } else {
        this.fechaHastaAlert = false;
      }

      if (!this.origen) {
        this.origenAlert = true;
        this.origenMessage = "Seleccione un origen";
        this.isValid = false;
      } else {
        if (this.origen == this.destino) {
          this.origenAlert = true;
          this.origenMessage = "El origen y destino no pueden ser iguales";
          this.isValid = false;
        } else {
          this.origenAlert = false;
        }
      }

      if (!this.destino) {
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        if (this.origen == this.destino) {
          this.destinoAlert = true;
          this.destinoMessage = "El origen y destino no pueden ser iguales";
          this.isValid = false;
        } else {
          this.destinoAlert = false;
        }
      }

      if (!this.valoracion) {
        this.valoracionAlert = true;
        this.valoracionMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        this.valoracionAlert = false;
      }

      if (!this.clase) {
        this.claseAlert = true;
        this.claseMessage = "Ingrese una clase";
        this.isValid = false;
      } else {
        this.claseAlert = false;
      }

      if (!this.aereolinea) {
        this.aereolineaAlert = true;
        this.aereolineaMessage = "Ingrese una Aereolinea";
        this.isValid = false;
      } else {
        this.aereolineaAlert = false;
      }

      if (!this.precio) {
        this.precioAlert = true;
        this.precioMessage = "Ingrese un precio";
        this.isValid = false;
      } else {
        this.precioAlert = false;
      }

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .post("https://localhost:57935/api/vuelo", {
            fechaida: this.fechaDesde,
            fechavuelta: this.fechaHasta,
            origen: this.origen,
            destino: this.destino,
            idavuelta: this.idaVuelta,
            valoracionaereolinea: this.valoracion,
            clase: this.clase,
            conescala: this.escala,
            accesodiscapacitados: this.discapacitados,
            nombreaereolinea: this.aereolinea,
            precio: this.precio
          })
          .then(() => {
            this.volver();
          })
          .catch(() => {
        //    alert("El vuelo no fue creado");
            this.vueloCreado = false;
               setTimeout(() => this.vueloCreado = true, 2000)
          });
      }
    }
  },
  mounted() {
    this.$axios
      .get("https://localhost:57935/api/destino")
      .then(response => (this.destinos = response.data));
    var date = new Date();
    this.currentDate = date.toISOString();
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
.color-red {
  color: red;
}
.btn {
  width: 200px;
}
</style>