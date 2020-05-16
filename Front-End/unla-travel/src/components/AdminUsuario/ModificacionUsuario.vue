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

      <button
        @click="volver"
        type="button"
        class="btn options btn-lg btn-block btn-primary"
      >Volver Al Menú</button>
      <br />
    </div>

    <div v-if="editElement">
      <h4 class="mb-3">Editar Usuario</h4>
      <div class="row">
        <div class="options text-center">
          <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="dni">DNI</label>
                <input type="text" class="form-control" id="dni" v-model="dni" required />
                <div v-if="dniAlert" class="alert alert-danger" role="alert">{{dniMessage}}</div>

                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" v-model="nombre" required />
                <div v-if="nombreAlert" class="alert alert-danger" role="alert">{{nombreMessage}}</div>

                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" v-model="apellido" required />
                <div
                  v-if="apellidoAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{apellidoMessage}}</div>

                <label for="nacionalidad">Nacionalidad</label>
                <input
                  type="text"
                  class="form-control"
                  id="nacionalidad"
                  v-model="nacionalidad"
                  required
                />
                <div
                  v-if="nacionalidadAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{nacionalidadMessage}}</div>

                <label for="domicilio">Domicilio</label>
                <input type="text" class="form-control" id="domicilio" v-model="domicilio" required />
                <div
                  v-if="domicilioAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{domicilioMessage}}</div>

                <label for="mail">Mail</label>
                <input type="text" class="form-control" id="mail" v-model="mail" required />
                <div v-if="mailAlert" class="alert alert-danger" role="alert">{{mailMessage}}</div>

                <label for="password">Contraseña</label>
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  v-model="password"
                  required
                />
                <div
                  v-if="contraseñaAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{contraseñaMessage}}</div>

                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" v-model="telefono" required />
                <div
                  v-if="telefonoAlert"
                  class="alert alert-danger"
                  role="alert"
                >{{telefonoMessage}}</div>

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
    </div>
    <br />
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

    dniAlert: {
      type: Boolean,
      default: false
    },
    dniMessage: null,
    nombreAlert: {
      type: Boolean,
      default: false
    },
    nombreMessage: null,
    apellidoAlert: {
      type: Boolean,
      default: false
    },
    apellidoMessage: null,
    nacionalidadAlert: {
      type: Boolean,
      default: false
    },
    nacionalidadMessage: null,
    domicilioAlert: {
      type: Boolean,
      default: false
    },
    domicilioMessage: null,
    mailAlert: {
      type: Boolean,
      default: false
    },
    mailMessage: null,
    contraseñaAlert: {
      type: Boolean,
      default: false
    },
    contraseñaMessage: null,
    telefonoAlert: {
      type: Boolean,
      default: false
    },
    telefonoMessage: null,

    users: null,
    dni: null,
    nombre: null,
    apellido: null,
    nacionalidad: null,
    domicilio: null,
    mail: null,
    password: null,
    telefono: null,
    usuario: null,
    user_to_modify_id: Number,
    isValid: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(user) {
      (this.dni = user.dni),
        (this.nombre = user.nombre),
        (this.apellido = user.apellido),
        (this.nacionalidad = user.nacionalidad),
        (this.domicilio = user.domicilio),
        (this.mail = user.mail),
        (this.password = user.contraseña),
        (this.telefono = user.telefono),
        (this.user_to_modify_id = user.id),
        (this.showList = false),
        (this.editElement = true);
    },
    cargaLista: function() {
      this.$axios
        .get("https://localhost:57935/api/usuario")
        .then(response => (this.users = response.data));
      (this.showList = true), (this.editElement = false);
    },
    validar() {
      this.isValid = true;

      if (!this.dni) {
        this.dniMessage = "Ingrese un DNI";
        this.dniAlert = true;
        this.isValid = false;
      } else {
        this.dniAlert = false;
      }

      if (!this.nombre) {
        this.nombreMessage = "Ingrese un nombre";
        this.nombreAlert = true;
        this.isValid = false;
      } else {
        this.nombreAlert = false;
      }

      if (!this.apellido) {
        this.apellidoMessage = "Ingrese un apellido";
        this.apellidoAlert = true;
        this.isValid = false;
      } else {
        this.apellidoAlert = false;
      }

      if (!this.nacionalidad) {
        this.nacionalidadMessage = "Ingrese una nacionalidad";
        this.nacionalidadAlert = true;
        this.isValid = false;
      } else {
        this.nacionalidadAlert = false;
      }

      if (!this.domicilio) {
        this.domicilioMessage = "Ingrese un domicilio";
        this.domicilioAlert = true;
        this.isValid = false;
      } else {
        this.domicilioAlert = false;
      }

      if (!this.mail) {
        this.mailMessage = "Ingrese un email";
        this.mailAlert = true;
        this.isValid = false;
      } else {
        this.mailAlert = false;
      }

      if (!this.password) {
        this.contraseñaMessage = "Ingrese una contraseña";
        this.contraseñaAlert = true;
        this.isValid = false;
      } else {
        this.contraseñaAlert = false;
      }

      if (!this.telefono) {
        this.telefonoMessage = "Ingrese un telefono";
        this.telefonoAlert = true;
        this.isValid = false;
      } else {
        this.telefonoAlert = false;
      }

      return this.isValid;
    },
    submit() {
      if (this.validar()) {
        this.$axios
          .put(
            "https://localhost:57935/api/usuario/" + this.user_to_modify_id,
            {
              id: this.user_to_modify_id,
              dni: this.dni,
              nombre: this.nombre,
              apellido: this.apellido,
              nacionalidad: this.nacionalidad,
              domicilio: this.domicilio,
              mail: this.mail,
              contraseña: this.password,
              telefono: this.telefono
            }
          )
          .then(() => this.cargaLista());
      }
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