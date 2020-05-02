<template>
  <div class="text-center">
    <h4 class="mb-3">Lista de Vuelo</h4>
     <form class="needs-validation" novalidate>
            <div class="row options">
              <div>            
                <label for="id-vuelo">Ingrese ID Vuelo</label>
                <input type="text" class="form-control" id="id-vuelo" placeholder="ID Vuelo" value="" required>
                
              </div>            
            </div>
          </form>
    <table class="table options">
      <thead class="thead-dark">
        <tr>
          <th scope="col">#</th>
          <th scope="col">Fecha Desde</th>
          <th scope="col">Fecha Hasta</th>
          <th scope="col">Origen</th>
          <th scope="col">Destino</th>
          <th scope="col">Clase</th>
          <th scope="col">Valoracion</th>
          <th scope="col">Ida y Vuelta</th>
          <th scope="col">Con Escala</th>
          <th scope="col">Acceso a Discapacitados</th>
          <th scope="col">Eliminar</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">1</th>
          <td>2020/05/22 24:00</td>
          <td>2020/07/22 24:00</td>
          <td>Buenos Aires, Argentina</td>
          <td>Miami</td>
          <td>VIP</td>
          <td>5</td>
          <td>True</td>
          <td>True</td>
          <td>True</td>
          <td><i class="fas fa-trash"></i></td>
        </tr>
      </tbody>
    </table>
    <br/>
    <button @click="volver" type="button" class="btn btn-lg btn-block btn-primary">Volver Al Menú</button>
  </div>
</template>

<script>
export default {
  name: "BajaVuelo",
  props: {
    msg: String,
    info: null
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
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