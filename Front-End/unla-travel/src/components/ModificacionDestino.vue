<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Destinos</h4>
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Pais</th>
          <th scope="col">Region</th>
          <th scope="col">Ciudad</th>
          <th scope="col">Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>United States</td>
          <td>New York</td>
          <td>New York</td>
          <td><button @click="cargaEdit"><i class="fas fa-edit"></i></button></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
        <h4 class="mb-3">Ingrese datos de Destino</h4>              
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="firstName">País</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Región</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Ciudad</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <br>
                <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
              </div>            
            </div>
          </form>   
        </div>             
    </div>
    <br>
    <div class="row">
        <div class="options text-center">
            <button @click="cargaLista" type="button" class="btn btn-lg btn-block btn-primary options text-center">Cancelar</button> 
        </div>             
    </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ModificacionAlojamiento",
  props: {
    showList: {
        type: Boolean,
        default: true
    },
    deleteElement: {
        type: Boolean,
        default: false
    },
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function () {
        this.showList = false,
        this.editElement = true
    },
    cargaLista: function () {
        this.showList = true,
        this.editElement = false
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