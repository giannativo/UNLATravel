<template>
<div class="container">
   <div class="text-center">
   <form class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesión</h1>
      <label for="mail">Mail</label>
      <input type="text" class="form-control" id="mail" v-model="mail" required />
      <div v-if="mailAlert" class="alert alert-danger" role="alert">{{mailMessage}}</div>
      <label for="password">Contraseña</label>
      <input type="password" class="form-control" id="password" v-model="password" required />
      <div v-if="contraseñaAlert" class="alert alert-danger" role="alert">{{contraseñaMessage}}</div>
      <br>
      <button @click="login" class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesion</button>
    </form>
    <br>
    <button @click="volver" class="btn btn-lg btn-primary btn-block" type="submit">Cancelar</button>
    </div>
</div>
</template>

<script>
export default {
  name: "Login",
  props: {
    mail: null,
    password: null,
    mailAlert: {
      type: Boolean,
      default: false
    },
    mailMessage: null,
    contraseñaAlert: {
      type: Boolean,
      default: false
    },
    contraseñaMessage: null
  },
  methods: {
    volver() {
      this.$parent.cargaHome();
    },
    cargaAdmin(){
      this.$parent.cargaAdmin();
    },
    validar() {
      this.isValid = true;
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
      return this.isValid;
    },
    login() {
      if(this.validar()){
        this.$axios
        .post('https://localhost:57935/api/auth/login', {
          mail: this.mail,
          password: this.password
        }).then((response) => {
          if (response.data.cod==200){
            localStorage.setItem('token', response.data.data);
            this.$parent.init();
          }
          if (response.data.cod==401){
            alert("Mail o contraseña incorrecta.");
          }
        });
      }
    }
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
</style>