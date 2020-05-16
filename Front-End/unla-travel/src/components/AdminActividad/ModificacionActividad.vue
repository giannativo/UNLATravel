<template>
  <div class="text-center">
    <div v-if="showList">
      <h4 class="mb-3">Lista Actividades</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Actividad</label>
            <input
              type="text"
              class="form-control"
              id="id-actividad"
              placeholder="ID Actividad"
              value
              required
              v-model="actividad"
              @input="init"
            />
          </div>
        </div>
        <br />
      </form>
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Actividad</th>
            <th scope="col">Fecha Desde</th>
            <th scope="col">Fecha Hasta</th>
            <th scope="col">Destino</th>
            <th scope="col">Descripcion</th>
            <th scope="col">Franja Horaria</th>

            <th scope="col">Valoracion</th>
            <th scope="col">Acceso a Discapacitados</th>

            <th scope="col">Editar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="actividad in actividades" :key="actividad.id">
            <th scope="row">{{actividad.id}}</th>
            <td>{{actividad.nombreActividad}}</td>
            <td>{{actividad.fechaDesde}}</td>
            <td>{{actividad.fechaHasta}}</td>
            <td>{{actividad.destino.ciudad}}, {{actividad.destino.region}}, {{actividad.destino.pais}}</td>
            <td>{{actividad.descripcion}}</td>
            <td>{{actividad.franjaHoraria}}</td>

            <td>{{actividad.valoracion}}</td>
            <td>{{actividad.accesoDiscapacitados}}</td>
            <td>
              <button @click="cargaEdit(actividad)">
                <i class="fas fa-edit"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <br />
      <button
        @click="volver"
        type="button"
        class="btn options btn-lg btn-block btn-primary"
      >Volver Al Menú</button>
      <br />
    </div>

    <div v-if="editElement">
      <h4 class="mb-3">Editar Actividad</h4>
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
                  <div
                    v-if="destinoAlert"
                    class="alert alert-danger"
                    role="alert"
                  >{{destinoMessage}}</div>
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
                  class="btn btn-lg btn-block btn-success options button-submit"
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
  </div>
</template>

<script>
export default {
  name: "ModificacionActividad",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    editElement: {
      type: Boolean,
      default: false
    },
    actividades: null,
    accesoDiscapacitados: null,
    descripcion: null,
    destino: null,
    fechaDesde: null,
    fechaHasta: null,
    franjaHoraria: null,
    lugar: null,
    nombreActividad: null,
    valoracion: null,
    actividad: null,
    actividad_to_modify_id: Number,

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
    cargaEdit: function(actividad) {
      (this.accesoDiscapacitados = actividad.accesoDiscapacitados),
        (this.descripcion = actividad.descripcion);
      (this.destino = actividad.destino.id),
        (this.fechaDesde = actividad.fechaDesde),
        (this.fechaHasta = actividad.fechaHasta),
        (this.franjaHoraria = actividad.franjaHoraria),
        (this.lugar = actividad.lugar),
        (this.nombreActividad = actividad.nombreActividad),
        (this.valoracion = actividad.valoracion),
        (this.actividad_to_modify_id = actividad.id),
        (this.showList = false),
        (this.editElement = true);
    },
    cargaLista: function() {
      this.$axios
        .get("https://localhost:57935/api/actividad")
        .then(response => (this.actividades = response.data));
      (this.showList = true), (this.editElement = false);
    },
    validar() {
      this.isValid = true;
      if (!this.nombreActividad) {
        this.tituloAlert = true;
        this.tituloMessage = "Ingrese un Título";
        this.isValid = false;
      } else {
        this.tituloAlert = true;
      }

      if (!this.descripcion) {
        this.descripcionAlert = true;
        this.descripcionMessage = "Ingrese un mensaje";
        this.isValid = false;
      } else {
        this.descripcionAlert = true;
      }

      if (!this.destino) {
        this.destinoAlert = true;
        this.destinoMessage = "Seleccione un destino";
        this.isValid = false;
      } else {
        this.destinoAlert = true;
      }

      if (!this.fechaDesde) {
        this.fechaDesdeAlert = true;
        this.fechaDesdeMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      } else {
        this.fechaDesdeAlert = true;
      }

      if (!this.fechaHasta) {
        this.fechaHastaAlert = true;
        this.fechaHastaMessage = "Ingrese una fecha-hora";
        this.isValid = false;
      } else {
        this.fechaHastaAlert = true;
      }

      if (!this.franjaHoraria) {
        this.franjaAlert = true;
        this.franjaMessage = "Ingrese una franja horaria";
        this.isValid = false;
      } else {
        this.franjaAlert = true;
      }

      if (!this.valoracion) {
        this.valoracionAlert = true;
        this.valoracionMessage = "Ingrese una valoracion";
        this.isValid = false;
      } else {
        this.valoracionAlert = true;
      }

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .put(
            "https://localhost:57935/api/actividad/" +
              this.actividad_to_modify_id,
            {
              id: this.actividad_to_modify_id,

              accesoDiscapacitados: this.accesoDiscapacitados,
              descripcion: this.descripcion,
              destino: this.destino,
              fechaDesde: this.fechaDesde,
              fechaHasta: this.fechaHasta,
              franjaHoraria: this.franjaHoraria,

              nombreActividad: this.nombreActividad,
              valoracion: this.valoracion
            }
          )
          .then(() => this.cargaLista());
      }
    },
    init() {
      if (!this.actividad) {
        this.$axios
          .get("https://localhost:57935/api/actividad")
          .then(response => (this.actividades = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/actividad/" + this.actividad)
          .then(response => (this.actividades = [response.data]));
      }
    }
  },
  mounted() {
    this.$axios
      .get("https://localhost:57935/api/destino")
      .then(response => (this.destinos = response.data));
    this.init();
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
.btn-primary {
  color: #fff;
  background-color: darkred;
  border-color: black;
}
</style>