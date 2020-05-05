<template>
  <div class="text-center">
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
          @click="volver"
          type="button"
          class="btn btn-lg btn-block btn-primary options text-center"
        >Volver Al Menú</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "AltaUsuario",
  props: {
    dni: null,
    nombre: null,
    apellido: null,
    nacionalidad: null,
    domicilio: null,
    mail: null,
    password: null,
    telefono: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      return true;
    },
    submit() {
      if(this.validar()){
        this.$axios
        .post('https://localhost:57935/api/usuario', {
          dni: this.dni,
          nombre: this.nombre,
          apellido: this.apellido,
          nacionalidad: this.nacionalidad,
          domicilio: this.domicilio,
          mail: this.mail,
          contraseña: this.password,
          telefono: this.telefono
        }).then(this.volver())
      }
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