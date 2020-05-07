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
            <th scope="col">Titulo</th>
            <th scope="col">Fecha Desde</th>
            <th scope="col">Fecha Hasta</th>
            <th scope="col">Destino</th>
            <th scope="col">Descripcion</th>
            <th scope="col">Franja Horaria</th>
            <th scope="col">Lugar</th>
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
            <td>{{actividad.destino}}</td>
            <td>{{actividad.descripcion}}</td>
            <td>{{actividad.franjaHoraria}}</td>
            <td>{{actividad.lugar}}</td>
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
      <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>

    <div v-if="editElement">
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
                <label for="fecha-desde">Fecha Desde</label>
                <input
                  type="text"
                  class="form-control"
                  id="fecha-desde"
                  placeholder="aaaa/mm/dd"
                  value
                  required
                  v-model="fechaDesde"
                />
                <input
                  type="text"
                  class="form-control"
                  id="fecha-desde"
                  placeholder="HH:MM"
                  value
                  required
                />

                <label for="fecha-hasta">Fecha Hasta</label>
                <input
                  type="text"
                  class="form-control"
                  id="fecha-hasta"
                  placeholder="aaaa/mm/dd"
                  value
                  required
                  v-model="fechaHasta"
                />
                <input
                  type="text"
                  class="form-control"
                  id="fecha-hasta"
                  placeholder="HH:MM"
                  value
                  required
                />

                <label for="destino">Destino</label>
                <input
                  v-model="destino"
                  type="text"
                  class="form-control"
                  id="destino"
                  placeholder
                  value
                  required
                />

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

                <label for="franja-horaria">Franja Horaria</label>
                <input
                  type="text"
                  class="form-control"
                  id="franja-horaria"
                  placeholder
                  value
                  required
                  v-model="franjaHoraria"
                />

                <label for="lugar">Lugar</label>
                <input
                  v-model="lugar"
                  type="text"
                  class="form-control"
                  id="lugar"
                  placeholder
                  value
                  required
                />

                <label for="valoracion">Valoración</label>
                <input
                  type="text"
                  class="form-control"
                  id="valoracion"
                  placeholder="1-5"
                  value
                  required
                  v-model="valoracion"
                />

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
            @click="cargaLista"
            type="button"
            class="btn btn-lg btn-block btn-primary options text-center"
          >Cancelar</button>
        </div>
      </div>
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
    actividad_to_modify_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(actividad) {
      (this.accesoDiscapacitados = actividad.accesoDiscapacitados),
        (this.descripcion = actividad.descripcion);
      (this.destino = actividad.destino),
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
      return true;
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
              lugar: this.lugar,
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
</style>