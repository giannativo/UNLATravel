<template>
  <div>
    <div class="my-3 p-3 rounded container">
      <div> 
        <b-card v-for="actividad in actividades" :key="actividad.id"
          title = " "
          img-src="https://picsum.photos/600/300/?image=25"
          img-alt="Image"
          img-top
          tag="article"
          class="mb-2 flight"
        >
          <h3> {{actividad.nombreActividad}} </h3>
          <h6>Fecha Desde: {{actividad.fechaDesde | moment("DD/MM/YYYY LT")}} </h6>
          <h6>Fecha Hasta: {{actividad.fechaHasta | moment("DD/MM/YYYY LT")}} </h6>
          <h6>Valoración: {{actividad.valoracion}} </h6>
          <h6 v-if="actividad.accesoDiscapacitados">Acceso a Discapacitados</h6>
          <h6>${{actividad.precio}}</h6>
          <b-card-text>{{actividad.descripcion}}</b-card-text>
          <b-button href="#" variant="primary">Reservar</b-button>
        </b-card>
       
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "VistaActividad",
  props: {
    actividades: null
  },

  mounted() {
    this.$axios
      .get(
        "https://localhost:57935/api/actividad/destino/" + this.$parent.destino
      )
      .then(response => (this.actividades = response.data));
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
.color-red {
  color: red;
}
.bv-example-row {
  max-height: 300px;
}
.flight {
  display: inline-block;
  max-width: 15rem;
  margin-right: 20px;
}
</style>