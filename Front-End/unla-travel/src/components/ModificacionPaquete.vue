<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Paquetes</h4>
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Tipo Paquete</th>
          <th scope="col">Destino</th>
          <th scope="col">Fecha de Ida</th>
          <th scope="col">Fecha de Vuelta</th>
          <th scope="col">Alojamiento</th>
          <th scope="col">Vuelo</th>
          <th scope="col">Actividad</th>
          <th scope="col">Cantidad de Personas</th>
          <th scope="col">Habitaciones</th>
          <th scope="col">Acceso a Discapacitados</th>
          <th scope="col">Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td>-</td>
          <td><button @click="cargaEdit"><i class="fas fa-edit"></i></button></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
        <h4 class="mb-3">Ingrese datos de Paquete</h4>              
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div>
                <label for="firstName">Tipo Paquete</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Destino</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Fecha de Ida</label>
                <input type="text" class="form-control" id="fecha-desde" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-desde" placeholder="HH:MM" value="" required>
                <label for="firstName">Fecha de Vuelta</label>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="HH:MM" value="" required>
                <label for="firstName">Alojamiento</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Vuelo</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Actividad</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Cantidad de Personas</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Habitaciones</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="acceso-discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>
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
  name: "ModificacionDestino",
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