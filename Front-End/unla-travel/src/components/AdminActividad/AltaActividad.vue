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
              <div v-if="tituloAlert" class="alert alert-danger" role="alert">{{tituloMessage}}</div>

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

              <div
                v-if="descripcionAlert"
                class="alert alert-danger"
                role="alert"
              >{{descripcionMessage}}</div>

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

              <div v-if="franjaAlert" class="alert alert-danger" role="alert">{{franjaMessage}}</div>

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
              <div
                v-if="precioAlert"
                class="alert alert-danger"
                role="alert"
              >{{precioMessage}}</div>

              

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
    precio: null,

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

    precioAlert: {
      type: Boolean,
      default: false
    },
    precioMessage: null,

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
      this.isValid = true;
      if (!this.nombreActividad) {
        this.tituloAlert = true;
        this.tituloMessage = "Ingrese un Título";
        this.isValid = false;
      } else {
        this.tituloAlert = false;
      }

      if (!this.descripcion) {
        this.descripcionAlert = true;
        this.descripcionMessage = "Ingrese un mensaje";
        this.isValid = false;
      } else {
        this.descripcionAlert = false;
      }

      if (!this.destino) {
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        this.destinoAlert = false;
      }

      if (!this.fechaDesde) {
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      } else {
        this.fechaDesdeAlert = false;
      }

      if (!this.fechaHasta) {
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      } else {
        this.fechaHastaAlert = false;
      }

      if (!this.franjaHoraria) {
        this.franjaAlert = true;
        this.franjaMessage = "Ingrese una franja horaria";
        this.isValid = false;
      } else {
        this.franjaAlert = false;
      }

      if (!this.valoracion) {
        this.valoracionAlert = true;
        this.valoracionMessage = "Ingrese una valoracion";
        this.isValid = false;
      } else {
        this.valoracionAlert = false;
      }

      if(!this.precio){
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
          .post("https://localhost:57935/api/actividad", {
            accesoDiscapacitados: this.accesoDiscapacitados,
            descripcion: this.descripcion,
            destino: this.destino,
            fechaDesde: this.fechaDesde,
            fechaHasta: this.fechaHasta,
            franjaHoraria: this.franjaHoraria,

            nombreActividad: this.nombreActividad,
            valoracion: this.valoracion,
            precio: this.precio
          })
          .then(() => {
            this.volver();
          })
          .catch(() => {
            alert("La actividad no fue creado");
          });
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
.color-red {
  color: red;
}
.btn {
  width: 200px;
}
</style>