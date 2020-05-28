<template>
  <div>
    <div v-if="showMenu" class="text-center">
      <h4 class="mb-3">Mi Perfil</h4>
      <div showMenu class="row">
        <div class="options text-center">
          <button
            
            @click="cargaEditarPerfil"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Editar mis Datos</button>
          <button
            
            @click="cargaMisViajes"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Mis Viajes</button>
          <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver</button>
        </div>
      </div>
    </div>
    <EditarPerfil v-if="showEditarPerfil" />
    <MisViajes v-if="showMisViajes"/>
    <br>
  </div>
  
</template>

<script>
import EditarPerfil from "./EditarPerfil.vue";
import MisViajes from "./MisViajes.vue";

export default {
  name: "MiPerfil",
  components: {
    EditarPerfil,
    MisViajes
  },
  props: {
    showMenu: {
      type: Boolean,
      default: true
    },
    showEditarPerfil: {
      type: Boolean,
      default: false
    },
    showMisViajes: {
      type: Boolean,
      default: false
    },
    current_user: null
  },
  methods: {
    volver() {
      this.$parent.cargaHome();
    },
    cargaEditarPerfil() {
      if(this.current_user){
        this.showMenu = false
        this.showEditarPerfil = true
        this.showMisViajes = false
      }
    },
    cargaMenu(){
       this.showMenu = true
       this.showEditarPerfil = false
       this.showMisViajes = false
    },
    cargaMisViajes(){
      this.showMenu = false
      this.showEditarPerfil = false
      this.showMisViajes = true
    },
    init(){
       this.$axios
        .get("https://localhost:57935/api/usuario/" + this.$parent.usuario.Id)
        .then(response => (this.current_user = [response.data]));
    },
  },
  mounted() {
    this.init();    
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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
.btn-primary {
  color: #fff;
  background-color: darkred;
  border-color: black;
}
</style>