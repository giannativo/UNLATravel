<template>
  <div class="text-center">
    <h4 class="mb-3">Alta Alojamiento</h4>
    <div class="row">
      <div v-show="!alojamientoCreado" class="alert alert-danger" role="alert">
         El alojamiento no se ha creado. Intente nuevamente
          </div>
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label for="nombre">Nombre</label>
              <input
                type="text"
                class="form-control"
                id="nombre"
                v-model="nombre"
                placeholder
                value
                required
              />
              <div v-if="tituloAlert" class="alert alert-danger" role="alert">{{tituloMessage}}</div>

              <label for="tipo-servicio">Tipo de Servicio</label>
              <input
                type="text"
                class="form-control"
                id="tipo_de_servicio"
                v-model="tipo_de_servicio"
                placeholder
                value
                required
              />
              <div v-if="servicioAlert" class="alert alert-danger" role="alert">{{servicioMessage}}</div>

              <label for="tipo-habitacion">Tipo Habitación</label>
              <input
                type="text"
                class="form-control"
                id="tipo_habitacion"
                v-model="tipo_habitacion"
                placeholder
                value
                required
              />
              <div
                v-if="habitacionAlert"
                class="alert alert-danger"
                role="alert"
              >{{habitacionMessage}}</div>

              <label for="tipo-habitacion">Link de Imagen</label>
              <input
                type="text"
                class="form-control"
                id="link"
                v-model="link"
                placeholder
                value
                required
              />
              <div v-if="linkAlert" class="alert alert-danger" role="alert">{{linkMessage}}</div>

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

              <label for="valoracion">Cantidad Estrellas</label>
              <input
                type="number"
                class="form-control"
                id="estrellas"
                v-model="estrellas"
                placeholder="1-5"
                min="1"
                max="5"
                value
                required
              />
              <div
                v-if="estrellasAlert"
                class="alert alert-danger"
                role="alert"
              >{{estrellasMessage}}</div>

              <div class="form-group">
                <label for="regimen">Seleccione un Tipo de Regimen</label>
                <select v-model="tipo_regimen" class="form-control" id="regimen">
                  <option
                    v-for="regimen in tipoRegimenes"
                    :key="regimen.id"
                    :value="regimen.id"
                  >{{regimen.descripcion}}</option>
                </select>
                <div v-if="regimenAlert" class="alert alert-danger" role="alert">{{regimenMessage}}</div>
              </div>

              <div class="form-group">
                <label for="tipo_alojamiento">Seleccione un Tipo Alojamiento</label>
                <select v-model="tipo_alojamiento" class="form-control" id="tipo_alojamiento">
                  <option
                    v-for="tipo in tipoAlojamientos"
                    :key="tipo.id"
                    :value="tipo.id"
                  >{{tipo.descripcion}}</option>
                </select>
                <div
                  v-if="alojamientoAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{alojamientoMessage}}</div>
              </div>
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
                  id="acceso-discapacitados"
                  v-model="acceso_a_discapacitados"
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
                class="btn options btn-lg btn-block btn-success"
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
          class="btn options btn-lg btn-block btn-danger options text-center"
        >Volver Al Menú</button>
      </div>
    </div>
    <br />
  </div>
</template>

<script>
export default {
  name: "AltaAlojamiento",
  props: {
    nombre: null,
    tipo_de_servicio: null,
    tipo_habitacion: null,
    destino: null,
    estrellas: null,
    tipo_alojamiento: null,
    tipo_regimen: null,
    acceso_a_discapacitados: null,
    isValid: null,
    destinos: null,
    tipoRegimenes: null,
    tipoAlojamientos: null,
    link: null,
    precio: null,

    tituloAlert: {
      type: Boolean,
      default: false
    },
    tituloMessage: null
  },

  servicioAlert: {
    type: Boolean,
    default: false
  },
  servicioMessage: null,

  linkAlert: {
    type: Boolean,
    default: false
  },
  linkMessage: null,

  habitacionAlert: {
    type: Boolean,
    default: false
  },
  habitacionMessage: null,

  destinoAlert: {
    type: Boolean,
    default: false
  },
  destinoMessage: null,

  estrellasAlert: {
    type: Boolean,
    default: false
  },
  estrellasMessage: null,
  precioAlert: {
    type: Boolean,
    default: false
  },
  precioMessage: null,

  alojamientoAlert: {
    type: Boolean,
    default: false
  },
  alojamientoMessage: null,
  alojamientoCreado:{
    type:Boolean,
    default:true
  },

  regimenAlert: {
    type: Boolean,
    default: false
  },
  regimenMessage: null,

  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid = true;

      if (!this.nombre) {
        this.tituloAlert = true;
        this.tituloMessage = "Ingrese un Titulo";
        this.isValid = false;
      } else {
        this.tituloAlert = false;
      }

      if (!this.tipo_de_servicio) {
        this.servicioAlert = true;
        this.servicioMessage = "Ingrese un tipo de servicio";
        this.isValid = false;
      } else {
        this.servicioAlert = false;
      }

      if (!this.tipo_habitacion) {
        this.habitacionAlert = true;
        this.habitacionMessage = "Ingrese un tipo de habitación";
        this.isValid = false;
      } else {
        this.habitacionAlert = false;
      }

      if (!this.destino) {
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        this.destinoAlert = false;
      }

      if (!this.estrellas) {
        this.estrellasAlert = true;
        this.estrellasMessage = "Ingrese cantidad de estrellas";
        this.isValid = false;
      } else {
        this.estrellasAlert = false;
      }

      if (!this.tipo_alojamiento) {
        this.alojamientoAlert = true;
        this.alojamientoMessage = "Seleccione tipo de alojamiento";
        this.isValid = false;
      } else {
        this.alojamientoAlert = false;
      }

      if (!this.tipo_regimen) {
        this.regimenAlert = true;
        this.regimenMessage = "Seleccione tipo de alojamiento";
        this.isValid = false;
      } else {
        this.regimenAlert = false;
      }

      if (!this.link) {
        this.linkAlert = true;
        this.linkMessage = "Ingrese URL de imagen";
        this.isValid = false;
      } else {
        this.linkAlert = false;
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
          .post("https://localhost:57935/api/alojamiento", {
            nombreAlojamiento: this.nombre,
            tipoServicio: this.tipo_de_servicio,
            tipoHabitacion: this.tipo_habitacion,
            destino: this.destino,
            cantidadEstrellas: this.estrellas,
            tipoAlojamiento: this.tipo_alojamiento,
            tipoRegimen: this.tipo_regimen,
            accesoDiscapacitados: this.acceso_a_discapacitados,
            link: this.link,
            precio: this.precio
          })
          .then(() => {
            this.volver();
          })
          .catch(() => {
              this.alojamientoCreado = false;
               setTimeout(() => this.alojamientoCreado = true, 2000)
            //alert("El Alojamiento no fue creado");
          });
      }
    }
  },
  mounted() {
    this.$axios
      .get("https://localhost:57935/api/destino")
      .then(response => (this.destinos = response.data));
    this.$axios
      .get("https://localhost:57935/api/tiporegimen")
      .then(response => (this.tipoRegimenes = response.data));
    this.$axios
      .get("https://localhost:57935/api/tipoalojamiento")
      .then(response => (this.tipoAlojamientos = response.data));
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