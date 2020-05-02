<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Alojamientos</h4>
    <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Alojamiento</label>
            <input
              type="text"
              class="form-control"
              id="id-alojamiento"
              placeholder="ID Alojamiento"
              value
              required
            />
          </div>
        </div>
      </form>
      <br>
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nombre</th>
          <th scope="col">Tipo de Servicio</th>
          <th scope="col">Tipo Habitación</th>
          <th scope="col">Destino</th>
          <th scope="col">Cantidad Estrellas</th>
          <th scope="col">Tipo Alojamiento</th>
          <th scope="col">Tipo Régimen</th>
          <th scope="col">Acceso a Discapacitados</th>
          <th scope="col">Editar</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>Hotel Four Seasons</td>
          <td></td>
          <td>Individual, Doble, Triple</td>
          <td>Buenos Aires, Argentina</td>
          <td>5</td>
          <td>Hotel</td>
          <td>Pension Completa</td>
          <td>Si</td>
          <td><button @click="cargaEdit"><i class="fas fa-edit"></i></button></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="editElement">
        <h4 class="mb-3">Editar Alojamiento</h4>
    <div class="row">
        <div class="options text-center">
         <form class="needs-validation" novalidate>
            <div class="row options">
              <div> 
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="" value="" required>           
                
                <label for="tipo-servicio">Tipo de Servicio</label>
                <input type="text" class="form-control" id="tipo-servicio" placeholder="" value="" required>
                                
                <label for="tipo-habitacion">Tipo Habitación</label>
                <input type="text" class="form-control" id="tipo-habitacion" placeholder="" value="" required>
                
                <label for="destino">Destino</label>
                <input type="text" class="form-control" id="destino" placeholder="" value="" required>
                
                <label for="valoracion">Cantidad Estrellas</label>
                <input type="text" class="form-control" id="valoracion" placeholder="1-5" value="" required>

                <label for="tipo-alojamiento">Tipo Alojamiento</label>
                <input type="text" class="form-control" id="tipo-alojamiento" placeholder="" value="" required>

                <label for="tipo-regimen">Tipo Régimen</label>
                <input type="text" class="form-control" id="tipo-regimen" placeholder="" value="" required>
               

                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="acceso-discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>



                
                <br>

                <button @click="cargaLista" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
                 
                
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