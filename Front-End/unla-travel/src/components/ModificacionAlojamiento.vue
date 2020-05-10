<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Alojamientos</h4>
    <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Alojamiento</label>
            <input
              type="number"
              class="form-control"
              id="id-alojamiento"
              placeholder="ID Alojamiento"
              @input="init"
              v-model="alojamiento_search_id"
            />
          </div>
        </div>
      <br>
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nombre</th>
          <th scope="col">Tipo de Servicio</th>
          <th scope="col">Tipo Habitación</th>
          <th scope="col">Destino</th>
          <th scope="col">Cantidad Estrellas</th>
          <th scope="col">Tipo Alojamiento</th>
          <th scope="col">Tipo Régimen</th>
          <th scope="col">Acceso a Discapacitados</th>
          <th scope="col">Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="place in places" :key="place.id">
          <th scope="row">{{ place.id }}</th>
          <td>{{ place.nombreAlojamiento }}</td>
          <td>{{ place.tipoServicio }}</td>
          <td>{{ place.tipoHabitacion }}</td>
          <td>{{ place.destino }}</td>
          <td>{{ place.cantidadEstrellas }}</td>
          <td>{{ place.tipoAlojamiento }}</td>
          <td>{{ place.tipoRegimen }}</td>
          <td>{{ place.accesoDiscapacitados }}</td>
          <td><button @click="cargaEdit(place)"><i class="fas fa-edit"></i></button></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
        <h4 class="mb-3">Editar Alojamiento</h4>
    <div class="row">
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
              <p v-if="tituloAlert" class="color-red">{{tituloMessage}}</p>

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
              <p v-if="servicioAlert" class="color-red">{{servicioMessage}}</p>
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
              <p v-if="habitacionAlert" class="color-red">{{habitacionMessage}}</p>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Destino</label>
                <select v-model="destino" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="destino in destinos" :key="destino.id">{{destino.id}}</option>
                </select>
              </div>
              <p v-if="destinoAlert" class="color-red">{{destinoMessage}}</p>
              <label for="valoracion">Cantidad Estrellas</label>
              <input
                type="number"
                class="form-control"
                id="estrellas"
                v-model="estrellas"
                placeholder="1-5"
                value
                required
              />
              <p v-if="estrellasAlert" class="color-red">{{estrellasMessage}}</p>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Tipo de Regimen</label>
                <select v-model="tipo_regimen" class="form-control" id="exampleFormControlSelect1">
                  <option v-for="regimen in tipoRegimenes" :key="regimen.id">{{regimen.id}}</option>
                </select>
              </div>

              <p v-if="regimenAlert" class="color-red">{{regimenMessage}}</p>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Seleccione un Tipo Alojamiento</label>
                <select
                  v-model="tipo_alojamiento"
                  class="form-control"
                  id="exampleFormControlSelect1"
                >
                  <option
                    v-for="alojamiento in tipoAlojamientos"
                    :key="alojamiento.id"
                  >{{alojamiento.id}}</option>
                </select>
              </div>
              <p v-if="alojamientoAlert" class="color-red">{{alojamientoMessage}}</p>
              <hr class="mb-4" />
              <div>
                <input
                  type="checkbox"
                  v-model="acceso_a_discapacitados"
                  id="acceso_a_discapacitados"
                />
                <label for="acceso-discapacitados">Acceso a Discapacitados</label>
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
  </div>
</template>

<script>
export default {
  name: "ModificacionAlojamiento",
  props: {
    showList: {
        type: Boolean,
        default: true
    },
    deleteElement: {
        type: Boolean,
        default: false
    },
    places: null,
    nombre: null,
    tipo_de_servicio: null,
    tipo_habitacion: null,
    destino: null,
    estrellas: null,
    tipo_alojamiento: null,
    tipo_regimen: null,
    acceso_a_discapacitados: null,
    alojamiento_to_modify_id: null,
    alojamiento_search_id: null,

    isValid: null,
    destinos: null,
    tipoRegimenes: null,
    tipoAlojamientos: null,

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

  alojamientoAlert: {
    type: Boolean,
    default: false
  },
  alojamientoMessage: null,

  regimenAlert: {
    type: Boolean,
    default: false
  },
  regimenMessage: null,
  
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(place) {
      this.nombre = place.nombreAlojamiento,
      this.tipo_de_servicio = place.tipoServicio,
      this.tipo_habitacion = place.tipoHabitacion,
      this.destino = place.destino,
      this.estrellas = place.cantidadEstrellas,
      this.tipo_alojamiento = place.tipoAlojamiento,
      this.tipo_regimen = place.tipoRegimen,
      this.acceso_a_discapacitados = place.accesoDiscapacitados,
      this.alojamiento_to_modify_id = place.id,
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function() {
        this.$axios
          .get("https://localhost:57935/api/alojamiento")
          .then(response => (this.places = response.data));
      (this.showList = true), (this.editElement = false);
    },
    init() {
      if (!this.alojamiento_search_id) {
        this.$axios
          .get("https://localhost:57935/api/alojamiento")
          .then(response => (this.places = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/alojamiento/" + this.alojamiento_search_id)
          .then(response => (this.places = [response.data]));
      }
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

      return this.isValid;
    },
    submit() {
      if(this.validar()){
        this.$axios
        .put('https://localhost:57935/api/alojamiento/'+this.alojamiento_to_modify_id, {
          id: this.alojamiento_to_modify_id,
          nombreAlojamiento: this.nombre,
          tipoServicio: this.tipo_de_servicio,
          tipoHabitacion: this.tipo_habitacion,
          destino: this.destino,
          cantidadEstrellas: this.estrellas,
          tipoAlojamiento: this.tipo_alojamiento,
          tipoRegimen: this.tipo_regimen,
          accesoDiscapacitados: this.acceso_a_discapacitados
        }).then( () => this.cargaLista())
      }
    },
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
</style>