<template>
  <div class="text-center">
    <h4 class="mb-3">Ingrese Datos de Usuario</h4>
    <div class="row">
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label for="dni">DNI</label>
              <input type="number" min="1" class="form-control" id="dni" v-model="dni" required />
               <div
                v-if="dniAlert"
                class="alert alert-danger"
                role="alert"
              >{{dniMessage}}</div>
              

              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" v-model="nombre" required />
              <div
                v-if="nombreAlert"
                class="alert alert-danger"
                role="alert"
              >{{nombreMessage}}</div>
              

              <label for="apellido">Apellido</label>
              <input type="text" class="form-control" id="apellido" v-model="apellido" required />
              <div
                v-if="apellidoAlert"
                class="alert alert-danger"
                role="alert"
              >{{apellidoMessage}}</div>
              

              <label for="nacionalidad">Nacionalidad</label>
              <input type="text" class="form-control" id="nacionalidad" v-model="nacionalidad" required />
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
              <div
                v-if="mailAlert"
                class="alert alert-danger"
                role="alert"
              >{{mailMessage}}</div>
              

              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" v-model="password" required />
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
              <button @click="submit" type="button" class="btn btn-lg btn-block btn-success options">Guardar Cambios</button>
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
    <br>
  </div>
</template>

<script>
export default {
  name: "AltaUsuario",
  props: {

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

    dni: null,
    nombre: null,
    apellido: null,
    nacionalidad: null,
    domicilio: null,
    mail: null,
    password: null,
    telefono: null,
    isValid: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    validar() {
      this.isValid = true;

      if(!this.dni){
        this.dniMessage = "Ingrese un DNI";
        this.dniAlert = true;
        this.isValid = false;
      }else{this.dniAlert=false;}

      if(!this.nombre){
        this.nombreMessage = "Ingrese un nombre";
        this.nombreAlert = true;
        this.isValid = false;
      }else{this.nombreAlert=false;}

      if(!this.apellido){
        this.apellidoMessage = "Ingrese un apellido";
        this.apellidoAlert = true;
        this.isValid = false;
      }else{this.apellidoAlert=false;}

      if(!this.nacionalidad){
        this.nacionalidadMessage = "Ingrese una nacionalidad";
        this.nacionalidadAlert = true;
        this.isValid = false;
      }else{this.nacionalidadAlert=false;}

      if(!this.domicilio){
        this.domicilioMessage = "Ingrese un domicilio";
        this.domicilioAlert = true;
        this.isValid = false;
      }else{this.domicilioAlert=false;}

      if(!this.mail){
        this.mailMessage = "Ingrese un email";
        this.mailAlert = true;
        this.isValid = false;
      }else{this.mailAlert=false;}

      if(!this.password){
        this.contraseñaMessage = "Ingrese una contraseña";
        this.contraseñaAlert = true;
        this.isValid = false;
      }else{this.contraseñaAlert=false;}

      if(!this.telefono){
        this.telefonoMessage = "Ingrese un telefono";
        this.telefonoAlert = true;
        this.isValid = false;
      }else{this.telefonoAlert=false;}
      
      
      return this.isValid;
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
          telefono: this.telefono,
          isAdmin: true
        }).then(() => {this.volver();}).catch(() => {alert("El Usuario no fue creado");});
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
.color-red{
  color: red;
}
.btn {
  width: 200px;
}
</style>