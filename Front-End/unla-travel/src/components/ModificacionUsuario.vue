<template>
  <div>
    <div class="text-center" v-if="showList">
      <h4 class="mb-3">Lista de Usuarios</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Usuario</label>
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
      <br />
      <table class="table options">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">DNI</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Nacionalidad</th>
            <th scope="col">Domicilio</th>
            <th scope="col">Mail</th>
            <th scope="col">Telefono</th>

            <th scope="col">Editar</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>11111111</td>
            <td>Mauro</td>
            <td>Pereyra</td>
            <td>Argentino</td>
            <td>Cordero</td>
            <td>mauro@hotmail.com</td>
            <td>1111-1111</td>

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
      <h4 class="mb-3">Ingrese Datos de Usuario</h4>
      <div class="row">
        <div class="options text-center">
          <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="dni">DNI</label>
                <input type="text" class="form-control" id="dni" placeholder value required />

                <label for="destino">Nombre</label>
                <input type="text" class="form-control" id="Nombre" placeholder value required />

                <label for="destino">Apellido</label>
                <input type="text" class="form-control" id="Apellido" placeholder value required />

                <label for="destino">Nacionalidad</label>
                <input type="text" class="form-control" id="Apellido" placeholder value required />

                <label for="destino">Domicilio</label>
                <input type="text" class="form-control" id="Apellido" placeholder value required />

                <label for="destino">Mail</label>
                <input type="text" class="form-control" id="Apellido" placeholder value required />

                <label for="destino">Telefono</label>
                <input type="text" class="form-control" id="Apellido" placeholder value required />

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
  name: "BajaUsuario",
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