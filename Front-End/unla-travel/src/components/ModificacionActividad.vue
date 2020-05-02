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
            <th scope="col">Acceso a Discapacitados</th>
            <th scope="col">Editar</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Caminata por la Cumbrecita</td>
            <td>2020/05/22 24:00</td>
            <td>2020/07/22 24:00</td>
            <td>Buenos Aires, Argentina</td>
            <td>Miami</td>
            <td>Descripcion</td>
            <td>8-20</td>
            <td>Lugar</td>
            <td>5</td>
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
      <h4 class="mb-3">ABM Actividades</h4>
      <div class="row">
        <div class="options text-center">
          <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="titulo">Titulo</label>
                <input type="text" class="form-control" id="titulo" placeholder value required />
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

                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder value required />

                <label for="descripcion">Descripción</label>
                <input type="text" class="form-control" id="descripcion" placeholder value required />

                <label for="franja-horaria">Franja Horaria</label>
                <input
                  type="text"
                  class="form-control"
                  id="franja-horaria"
                  placeholder
                  value
                  required
                />

                <label for="lugar">Lugar</label>
                <input type="text" class="form-control" id="lugar" placeholder value required />

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
  name: "ModificacionActividad",
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