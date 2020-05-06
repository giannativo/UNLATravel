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
              <button @click="cargaEdit(user)">
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
              <input type="text" class="form-control" id="dni" v-model="dni" required />

              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" v-model="nombre" required />

              <label for="apellido">Apellido</label>
              <input type="text" class="form-control" id="apellido" v-model="apellido" required />

              <label for="nacionalidad">Nacionalidad</label>
              <input type="text" class="form-control" id="nacionalidad" v-model="nacionalidad" required />

              <label for="domicilio">Domicilio</label>
              <input type="text" class="form-control" id="domicilio" v-model="domicilio" required />

              <label for="mail">Mail</label>
              <input type="text" class="form-control" id="mail" v-model="mail" required />

              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" v-model="password" required />

              <label for="telefono">Telefono</label>
              <input type="text" class="form-control" id="telefono" v-model="telefono" required />

              <br />
              <button @click="submit" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
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
  name: "ModificacionUsuario",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    editElement: {
      type: Boolean,
      default: false
    },
    users: null,
    dni: null,
    nombre: null,
    apellido: null,
    nacionalidad: null,
    domicilio: null,
    mail: null,
    password: null,
    telefono: null,
    user_to_modify_id: Number
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(user) {
      this.dni = user.dni,
      this.nombre = user.nombre,
      this.apellido = user.apellido,
      this.nacionalidad = user.nacionalidad,
      this.domicilio = user.domicilio,
      this.mail = user.mail,
      this.password = user.contraseña,
      this.telefono = user.telefono,
      this.user_to_modify_id = user.id,
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function() {
      this.$axios
      .get('https://localhost:57935/api/usuario')
      .then(response => (this.users = response.data));
      (this.showList = true), (this.editElement = false);
    },
    validar() {
      return true;
    },
    submit() {
      if(this.validar()){
        this.$axios
        .put('https://localhost:57935/api/usuario/'+this.user_to_modify_id, {
          id: this.user_to_modify_id,
          dni: this.dni,
          nombre: this.nombre,
          apellido: this.apellido,
          nacionalidad: this.nacionalidad,
          domicilio: this.domicilio,
          mail: this.mail,
          contraseña: this.password,
          telefono: this.telefono
        }).then( () => this.cargaLista())
      }
    }
  },
  mounted () {
    this.$axios
      .get('https://localhost:57935/api/usuario')
      .then(response => (this.users = response.data))
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