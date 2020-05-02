<template>
  <div>
    <div v-if="showList">  
    <h4 class="mb-3">Lista de Alojamientos</h4>
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
          <th scope="col">Eliminar</th>
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
          <td><button @click="cargaDelete"><i class="fas fa-trash"></i></button></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
    </div>
    <div v-if="deleteElement">
        <p>Desea eliminar este elemento?</p>
        <button @click="cargaLista" type="button" class="btn btn-lg btn-block btn-primary">Si</button>
        <button @click="cargaLista" type="button" class="btn btn-lg btn-block btn-primary">No</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "BajaAlojamiento",
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
    cargaDelete: function () {
        this.showList = false,
        this.deleteElement = true
    },
    cargaLista: function () {
        this.showList = true,
        this.deleteElement = false
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