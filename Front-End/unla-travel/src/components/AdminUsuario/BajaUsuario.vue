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
              placeholder="ID Usuario"
              @input="init"
              v-model="usuario"
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
            <th scope="col">Eliminar</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in users" :key="user.id">
            <th scope="row">{{ user.id }}</th>
            <td>{{ user.dni }}</td>
            <td>{{ user.nombre }}</td>
            <td>{{ user.apellido }}</td>
            <td>{{ user.nacionalidad }}</td>
            <td>{{ user.domicilio }}</td>
            <td>{{ user.mail }}</td>
            <td>{{ user.telefono }}</td>
            <td>
              <button @click="cargaDelete(user.id)">
                <i class="fas fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
      <br />

      <button @click="volver" type="button" class="btn options btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="deleteElement">
      <p>Desea eliminar este elemento?</p>
      <button @click="deleteUsuario" type="button" class="btn options btn-lg btn-block btn-success">Si</button>
      <button @click="cargaLista" type="button" class="btn options btn-lg btn-block btn-danger">No</button>
    </div>
    <br>
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
    deleteElement: {
      type: Boolean,
      default: false
    },
    users: null,
    usuario: null,
    user_to_delete_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaDelete: function(user_id) {
      (this.showList = false), (this.deleteElement = true);
      this.user_to_delete_id = user_id;
    },
    cargaLista: function() {
      this.$axios
        .get('https://localhost:57935/api/usuario')
        .then(response => (this.users = response.data));
      (this.showList = true), (this.deleteElement = false);
    },
    deleteUsuario() {
      this.$axios.delete('https://localhost:57935/api/usuario/'+this.user_to_delete_id)
      .then(() => this.cargaLista())
    },
    init() {
      if (!this.usuario) {
        this.$axios
          .get("https://localhost:57935/api/usuario")
          .then(response => (this.users = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/usuario/" + this.usuario)
          .then(response => (this.users = [response.data]));
      }
    },
  },
  
  mounted() {
    this.init();
  },
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
.btn {
  width: 200px;
}
.btn-primary {
    color: #fff;
    background-color: darkred;
    border-color: black;
}

</style>