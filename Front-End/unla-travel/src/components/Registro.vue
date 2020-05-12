<template>
  <div class="text-center">
    <h4 class="mb-3">Ingrese sus datos personales</h4>
    <div class="row">
      <div class="options text-center">
        <form class="needs-validation" novalidate>
          <div class="row options">
            <div>
              <label for="dni">DNI</label>
              <input type="text" class="form-control" id="dni" v-model="dni" required />
              <p v-if="dniAlert" class="color-red"> {{dniMessage}} </p>

              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" v-model="nombre" required />
              <p v-if="nombreAlert" class="color-red"> {{nombreMessage}} </p>

              <label for="apellido">Apellido</label>
              <input type="text" class="form-control" id="apellido" v-model="apellido" required />
              <p v-if="apellidoAlert" class="color-red"> {{apellidoMessage}} </p>

              <label for="nacionalidad">Nacionalidad</label>
              <input type="text" class="form-control" id="nacionalidad" v-model="nacionalidad" required />
              <p v-if="nacionalidadAlert" class="color-red"> {{nacionalidadMessage}} </p>
           
              <label for="domicilio">Domicilio</label>
              <input type="text" class="form-control" id="domicilio" v-model="domicilio" required />
              <p v-if="domicilioAlert" class="color-red"> {{domicilioMessage}} </p>

              <label for="mail">Mail</label>
              <input type="text" class="form-control" id="mail" v-model="mail" required />
              <p v-if="mailAlert" class="color-red"> {{mailMessage}} </p>

              <label for="password">Contraseña</label>
              <input type="password" class="form-control" id="password" v-model="password" required />
              <p v-if="contraseñaAlert" class="color-red"> {{contraseñaMessage}} </p>

              <label for="telefono">Telefono</label>
              <input type="text" class="form-control" id="telefono" v-model="telefono" required />
              <p v-if="telefonoAlert" class="color-red"> {{telefonoMessage}} </p>

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
  name: "Registro",
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
          rol : false
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
.color-red{
  color: red;
}
</style>