<template>
  <div class="text-center">
    <h4 class="mb-3">Ingrese datos de Paquete</h4>
    <div class="row">
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label>Tipo Paquete</label>
              <input
                type="text"
                v-model="tipoPaquete"
                class="form-control"
                id="firstName"
                placeholder
                value
                required
              />
              <div v-if="paqueteAlert" class="alert alert-danger" role="alert">{{paqueteMessage}}</div>
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
                v-model="fechaIda"
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
                v-model="fechaVuelta"
                required
              ></datetime>

              <div
                v-if="fechaHastaAlert"
                class="alert alert-danger"
                role="alert"
              >{{fechaHastaMessage}}</div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Alojamiento</label>
                <select v-model="alojamiento" class="form-control" id="exampleFormControlSelect1">
                  <option
                    v-for="alojamiento in alojamientos"
                    :key="alojamiento.id"
                    :value="alojamiento.id"
                  >{{alojamiento.nombreAlojamiento}}</option>
                </select>
              </div>
              <div
                v-if="alojamientoAlert"
                class="alert alert-danger"
                role="alert"
              >{{alojamientoMessage}}</div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Vuelo</label>
                <select v-model="vuelo" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="vuelo in vuelos" :key="vuelo.id">{{vuelo.id}}</option>
                </select>
              </div>
              <div v-if="vueloAlert" class="alert alert-danger" role="alert">{{vueloMessage}}</div>

              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione una Actividad</label>
                <select v-model="actividad" class="form-control" id="exampleFormControlSelect1">
                  <option
                    v-for="actividad in actividades"
                    :key="actividad.id"
                    :value="actividad.id"
                  >{{actividad.nombreActividad}}</option>
                </select>
              </div>
              <div
                v-if="actividadAlert"
                class="alert alert-danger"
                role="alert"
              >{{actividadMessage}}</div>

              <label for="firstName">Cantidad de Personas</label>
              <input
                type="text"
                v-model="cantidadPersonas"
                class="form-control"
                id="firstName"
                placeholder
                value
                required
              />
              <div v-if="personasAlert" class="alert alert-danger" role="alert">{{personasMessage}}</div>

              <label for="firstName">Habitaciones</label>
              <input
                type="text"
                v-model="habitaciones"
                class="form-control"
                id="firstName"
                placeholder
                value
                required
              />
              <div
                v-if="habitacionesAlert"
                class="alert alert-danger"
                role="alert"
              >{{habitacionesMessage}}</div>

              <div class="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  v-model="accesoDiscapacitados"
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
  name: "AltaPaquete",
  props: {
    tipoPaquete: null,
    destino: null,
    fechaIda: null,
    fechaVuelta: null,
    alojamiento: null,
    vuelo: null,
    actividad: null,
    cantidadPersonas: null,
    habitaciones: null,
    accesoDiscapacitados: null,

    destinos: null,
    vuelos: null,
    actividades: null,
    alojamientos: null,
    isValid: null,

    paqueteAlert: {
      type: Boolean,
      default: false
    },
    paqueteMessage: null,

    destinoAlert: {
      type: Boolean,
      default: false
    },
    destinoMessage: null,

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

    alojamientoAlert: {
      type: Boolean,
      default: false
    },
    alojamientoMessage: null,

    vueloAlert: {
      type: Boolean,
      default: false
    },
    vueloMessage: null,

    actividadAlert: {
      type: Boolean,
      default: false
    },
    actividadMessage: null,

    personasAlert: {
      type: Boolean,
      default: false
    },
    personasMessage: null,

    habitacionesAlert: {
      type: Boolean,
      default: false
    },
    habitacionesMessage: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid = true;
      if (!this.tipoPaquete) {
        this.paqueteAlert = true;
        this.paqueteMessage = "Ingrese tipo Paquete";
        this.isValid = false;
      } else {
        this.paqueteAlert = false;
      }

      if (!this.destino) {
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        this.destinoAlert = false;
      }

      if (!this.fechaIda) {
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Seleccione una fecha";
        this.isValid = false;
      } else {
        this.fechaDesdeAlert = false;
      }

      if (!this.fechaVuelta) {
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Seleccione una fecha";
        this.isValid = false;
      } else {
        this.fechaHastaAlert = false;
      }

      if (!this.alojamiento) {
        this.alojamientoAlert = true;
        this.alojamientoMessage = "Seleccione una alojamiento";
        this.isValid = false;
      } else {
        this.alojamientoAlert = false;
      }

      if (!this.vuelo) {
        this.vueloAlert = true;
        this.vueloMessage = "Seleccione un vuelo";
        this.isValid = false;
      } else {
        this.vueloAlert = false;
      }

      if (!this.actividad) {
        this.actividadAlert = true;
        this.actividadMessage = "Seleccione una actividad";
        this.isValid = false;
      } else {
        this.actividadAlert = false;
      }

      if (!this.cantidadPersonas) {
        this.personasAlert = true;
        this.personasMessage = "Ingrese cantidad de personas";
        this.isValid = false;
      } else {
        this.actividadAlert = false;
      }

      if (!this.habitaciones) {
        this.habitacionesAlert = true;
        this.habitacionesMessage = "Ingrese cantidad de personas";
        this.isValid = false;
      } else {
        this.habitacionesAlert = false;
      }

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .post("https://localhost:57935/api/paquete", {
            tipoPaquete: this.tipoPaquete,
            destino: this.destino,
            fechaIda: this.fechaIda,
            fechaVuelta: this.fechaVuelta,
            alojamiento: this.alojamiento,
            vuelo: this.vuelo,
            actividad: this.actividad,
            cantidadPersonas: this.cantidadPersonas,
            habitaciones: this.habitaciones,
            accesoDiscapacitados: this.accesoDiscapacitados
          })
          .then(() => {
            this.volver();
          })
          .catch(() => {
            alert("El Paquete no fue creado");
          });
      }
    }
  },
  mounted() {
    this.$axios
      .get("https://localhost:57935/api/destino")
      .then(response => (this.destinos = response.data));
    this.$axios
      .get("https://localhost:57935/api/alojamiento")
      .then(response => (this.alojamientos = response.data));
    this.$axios
      .get("https://localhost:57935/api/actividad")
      .then(response => (this.actividades = response.data));
    this.$axios
      .get("https://localhost:57935/api/vuelo")
      .then(response => (this.vuelos = response.data));
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