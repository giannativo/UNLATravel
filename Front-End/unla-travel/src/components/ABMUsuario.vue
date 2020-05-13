<template>
<div>
<div v-if="showMenu" class="text-center">
    <h4 class="mb-3">ABM Usuario</h4>
    <div class="row">
        <div class="options text-center">
            <button @click="cargaAlta" type="button" class="btn btn-lg btn-block btn-primary">Altas</button>
            <button @click="cargaBaja" type="button" class="btn btn-lg btn-block btn-primary">Bajas</button>
            <button @click="cargaModificacion" type="button" class="btn btn-lg btn-block btn-primary">Modificaciones</button>
            <button @click="cargaVisualizar" type="button" class="btn btn-lg btn-block btn-primary">Visualizar</button>
            <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver</button>
        </div>             
    </div>
    
</div>


<AltaUsuario v-if="showAlta"/>
<BajaUsuario v-if="showBaja"/>
<ModificacionUsuario v-if="showModificacion"/>
<VisualizarUsuario v-if="showVisualizar"/>
</div>
</template>

<script>
import AltaUsuario from './AltaUsuario.vue'
import BajaUsuario from './BajaUsuario.vue'
import ModificacionUsuario from './ModificacionUsuario.vue'
import VisualizarUsuario from './VisualizarUsuario.vue'
export default {
  name: 'ABMUsuario',
  components: {
    AltaUsuario,
    BajaUsuario,
    ModificacionUsuario,
    VisualizarUsuario
  },
  props: {
     showMenu: {
        type: Boolean,
        default: true
    },
    showAlta: {
        type: Boolean,
        default: false
    },
     showBaja: {
        type: Boolean,
        default: false
    },
    showModificacion: {
        type: Boolean,
        default: false
    },
    showVisualizar: {
        type: Boolean,
        default: false
    },
  },
  methods: {
    volver(){
        this.$parent.cargaMenu();
    },
    cargaMenu: function () {
        this.showMenu = true,
        this.showAlta = false,
        this.showBaja = false,
        this.showModificacion = false,
        this.showVisualizar = false
    },
    cargaAlta: function () {
        this.showMenu = false,
        this.showAlta = false,
        this.showAlta = true,
        this.showModificacion = false,
        this.showVisualizar = false
    },
    cargaBaja: function () {
        this.showMenu = false,
        this.showBaja = true,
        this.showAlta = false,
        this.showModificacion = false,
        this.showVisualizar = false
    },
    cargaModificacion: function () {
        this.showMenu = false,
        this.showBaja = false,
        this.showAlta = false,
        this.showModificacion = true,
        this.showVisualizar = false
    },
    cargaVisualizar: function () {
        this.showMenu = false,
        this.showBaja = false,
        this.showAlta = false,
        this.showModificacion = false,
        this.showVisualizar = true
    },
  }
}
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
    box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); 
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