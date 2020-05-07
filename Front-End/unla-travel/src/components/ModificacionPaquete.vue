<template>
  <div class="text-center">
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Paquetes</h4>
      <form class="needs-validation" novalidate>
        <div class="row options">
          <div>
            <label for="id-vuelo">Ingrese ID Paquete</label>
            <input
              type="text"
              class="form-control"
              id="id-usuario"
              @input="init"
              v-model="paquete"
              placeholder="ID Paquete"
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
        <tr v-for="paquete in paquetes" :key="paquete.id">
          <th scope="row">{{paquete.id}}</th>
          <td>{{paquete.tipoPaquete}}</td>
          <td>{{paquete.destino}}</td>
          <td>{{paquete.fechaIda}}</td>
          <td>{{paquete.fechaVuelta}}</td>
          <td>{{paquete.alojamiento}}</td>
          <td>{{paquete.vuelo}}</td>
          <td>{{paquete.actividad}}</td>
          <td>{{paquete.cantidadPersonas}}</td>
          <td>{{paquete.habitaciones}}</td>
          <td>{{paquete.accesoDiscapacitados}}</td>
          <td>
              <button @click="cargaEdit(paquete)">
                <i class="fas fa-edit"></i>
              </button>
            </td>
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
                <input v-model="tipoPaquete" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Destino</label>
                <input v-model="destino" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Fecha de Ida</label>
                <input v-model="fechaIda" type="text" class="form-control" id="fecha-desde" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-desde" placeholder="HH:MM" value="" required>
                <label for="firstName">Fecha de Vuelta</label>
                <input v-model="fechaVuelta" type="text" class="form-control" id="fecha-hasta" placeholder="aaaa/mm/dd" value="" required>
                <input type="text" class="form-control" id="fecha-hasta" placeholder="HH:MM" value="" required>
                <label for="firstName">Alojamiento</label>
                <input v-model="alojamiento" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Vuelo</label>
                <input v-model="vuelo" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Actividad</label>
                <input v-model="actividad" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Cantidad de Personas</label>
                <input v-model="cantidadPersonas" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <label for="firstName">Habitaciones</label>
                <input v-model="habitaciones" type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="custom-control custom-checkbox">
                <input v-model="accesoDiscapacitados" type="checkbox" class="custom-control-input" id="acceso-discapacitados">
                <label class="custom-control-label" for="acceso-discapacitados">Acceso a Discapacitados</label>
                </div>
                <br>
                <button @click="submit" type="button" class="btn btn-lg btn-block btn-primary">Guardar Cambios</button>
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
  name: "ModificacionPaquete",
  props: {
    showList: {
      type: Boolean,
      default: true
    },
    editElement: {
      type: Boolean,
      default: false
    },
    tipoPaquete: null,
          destino: null,
          fechaIda: null,
          fechaVuelta: null,
          alojamiento: null,
          vuelo: null,
          actividad: null,
          cantidadPersonas: null,
          habitaciones: null,
          accesoDiscapacitados: null,
    paquete: null,
    paquetes: null,
    paquete_to_modify_id: Number
    
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaEdit: function(paquete) {
        this.tipoPaquete = paquete.tipoPaquete,
         this.destino = paquete.destino,
          this.fechaIda = paquete.fechaIda,
          this.fechaVuelta = paquete.fechaVuelta,
          this.alojamiento = paquete.alojamiento,
          this.vuelo = paquete.vuelo,
          this.actividad = paquete.actividad,
          this.cantidadPersonas = paquete.cantidadPersonas,
          this.habitaciones = paquete.habitaciones,
          this.accesoDiscapacitados = paquete.accesoDiscapacitados,
          this.paquete_to_modify_id = paquete.id,
      
      (this.showList = false), (this.editElement = true);
    },
    cargaLista: function() {
      this.$axios
      .get('https://localhost:57935/api/paquete')
      .then(response => (this.paquetes = response.data));
      (this.showList = true), (this.editElement = false);
    },
    validar() {
      return true;
    },
      submit() {
      if(this.validar()){
        this.$axios
        .put('https://localhost:57935/api/paquete/' + this.paquete_to_modify_id, {
          id: this.paquete_to_modify_id,
          tipoPaquete: this.tipoPaquete,
          destino: this.destino,
          fechaIda: this.fechaIda,
          fechaVuelta: this.fechaVuelta,
          alojamiento: this.alojamiento,
          vuelo: this.vuelo,
          actividad: this.actividad,
          cantidadPersonas: this.cantidadPersonas,
          habitaciones: this.habitaciones,
          accesoDiscapacitados: this.accesoDiscapacitados
        }).then(this.volver())
      }
    },
init() {
      if (!this.paquete) {
        this.$axios
          .get("https://localhost:57935/api/paquete")
          .then(response => (this.paquetes = response.data));
      } else {
        this.$axios
          .get("https://localhost:57935/api/paquete/" + this.paquete)
          .then(response => (this.paquetes = [response.data]));
      }
    }

  },
  mounted () {
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
</style>