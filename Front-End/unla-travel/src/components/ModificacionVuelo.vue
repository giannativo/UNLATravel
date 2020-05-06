<template>
  <div class="text-center">
    <div v-if="showList">
      <h4 class="mb-3">Lista Vuelos</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Vuelo</label>
            <input
              type="text"
              class="form-control"
              id="id-vuelo"
              placeholder="ID Vuelo"
              value
              required
              @input="init"
              v-model="vuelo"
            />
          </div>
        </div>
      </form>
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Fecha Desde</th>
            <th scope="col">Fecha Hasta</th>
            <th scope="col">Origen</th>
            <th scope="col">Destino</th>
            <th scope="col">Clase</th>
            <th scope="col">Valoracion</th>
            <th scope="col">Ida y Vuelta</th>
            <th scope="col">Con Escala</th>
            <th scope="col">Acceso a Discapacitados</th>
            <th scope="col">Editar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="vuelo in vuelos" :key="vuelo.id">
            <th scope="row">{{vuelo.id}}</th>
            <td>{{vuelo.fechaIda}}</td>
            <td>{{vuelo.fechaVuelta}}</td>
            <td>{{vuelo.origen}}</td>
            <td>{{vuelo.destino}}</td>
            <td>{{vuelo.clase}}</td>
            <td>{{vuelo.valoracionAereolinea}}</td>
            <td>{{vuelo.idaVuelta}}</td>
            <td>{{vuelo.conEscala}}</td>
            <td>{{vuelo.accesoDiscapacitados}}</td>
            <td>
              <button @click="cargaEdit(vuelo)">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <br />
      <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
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
                  placeholder="aaaa/mm/dd"
                  value
                  v-model="fechaDesde"
                  required
                />
                <input
                  type="text"
                  class="form-control"
                  id="fecha-desde"
                  placeholder="HH:MM"
                  value
                  v-model="horaDesde"
                  required
                />

                <label for="fecha-hasta">Fecha Hasta</label>
                <input
                  type="text"
                  class="form-control"
                  id="fecha-hasta"
                  placeholder="aaaa/mm/dd"
                  value
                  v-model="fechaHasta"
                  required
                />
                <input
                  type="text"
                  class="form-control"
                  id="fecha-hasta"
                  placeholder="HH:MM"
                  value
                  v-model="horaHasta"
                  required
                />

                <label for="origen">Origen</label>
                <input
                  type="text"
                  class="form-control"
                  id="origen"
                  placeholder
                  value
                  v-model="origen"
                  required
                />

                <label for="destino">Destino</label>
                <input
                  type="text"
                  class="form-control"
                  id="destino"
                  placeholder
                  value
                  v-model="destino"
                  required
                />

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
  name: "ModificacionAlojamiento",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    editElement: {
      type: Boolean,
      default: false
    },
    vuelos: [],
    fechaDesde: null,

    fechaHasta: null,

    origen: null,
    destino: null,
    clase: null,
    valoracion: null,
    idaVuelta: null,
    escala: null,
    discapacitados: null,
    vuelo_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(vuelo) {
        
        this.fechaDesde = vuelo.fechaIda,
        this.fechaHasta = vuelo.fechaVuelta,
        this.origen = vuelo.origen,
        this.destino = vuelo.destino,
        this.clase = vuelo.clase,
        this.valoracion = vuelo.valoracionAereolinea,
        this.idaVuelta = vuelo.idaVuelta,
        this.escala = vuelo.conEscala,
        this.discapacitados = vuelo.accesoDiscapacitados,
        
        this.vuelo_to_delete_id = vuelo.id,
    
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function() {
      this.$axios
        .get("https://localhost:57935/api/vuelo")
        .then(response => (this.vuelos = response.data));
      (this.showList = true), (this.editElement = false);
    },
    init() {
      if (!this.vuelo) {
        this.$axios
          .get("https://localhost:57935/api/vuelo")
          .then(response => (this.vuelos = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/vuelo/" + this.vuelo)
          .then(response => (this.vuelos = [response.data]));
      }
    },
    validar() {
      return true;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .put("https://localhost:57935/api/vuelo/" + this.vuelo_to_delete_id, {
            id: this.vuelo_to_delete_id,
            fechaida: this.fechaDesde,
            fechavuelta: this.fechaHasta,
            origen: this.origen,
            destino: this.destino,
            idavuelta: this.idaVuelta,
            valoracion: this.valoracion,
            clase: this.clase,
            conescala: this.escala,
            accesodiscapacitados: this.discapacitados
          })
          .then(() => this.cargaLista());
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