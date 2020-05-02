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
          <tr>
            <th scope="row">1</th>
            <td>2020/05/22 24:00</td>
            <td>2020/07/22 24:00</td>
            <td>Buenos Aires, Argentina</td>
            <td>Miami</td>
            <td>VIP</td>
            <td>5</td>
            <td>True</td>
            <td>True</td>
            <td>True</td>
            <td>
              <button @click="cargaEdit">
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
                  required
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
                />
                <input
                  type="text"
                  class="form-control"
                  id="fecha-hasta"
                  placeholder="HH:MM"
                  value
                  required
                />

                <label for="origen">Origen</label>
                <input type="text" class="form-control" id="origen" placeholder value required />

                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder value required />

                <label for="destino">Clase</label>
                <input type="text" class="form-control" id="destino" placeholder value required />

                <label for="valoracion">Valoración</label>
                <input
                  type="text"
                  class="form-control"
                  id="valoracion"
                  placeholder="1-5"
                  value
                  required
                />

                <hr class="mb-4" />
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="ida-vuelta" />
                  <label class="custom-control-label" for="ida-vuelta">Ida y Vuelta</label>
                </div>

                <hr class="mb-4" />
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="escala" />
                  <label class="custom-control-label" for="escala">Con Escala</label>
                </div>

                <hr class="mb-4" />
                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" id="acceso-discapacitados" />
                  <label
                    class="custom-control-label"
                    for="acceso-discapacitados"
                  >Acceso a Discapacitados</label>
                </div>
                <br />
                <button type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
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
    }
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function() {
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function() {
      (this.showList = true), (this.editElement = false);
    }
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