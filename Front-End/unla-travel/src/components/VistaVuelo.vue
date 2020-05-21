<template>
 <div>
    <div class="my-3 p-3 rounded container">   
    <div>
  <b-card v-for="vuelo in vuelos" :key="vuelo.id"
    img-src="https://www.aerolineas.com.ar/images/flota/boeing.jpg"
    img-alt="Image"
    img-top
    tag="flight"
    class="mb-2 flight"
  >
    <h6>{{vuelo.origen.ciudad}}, {{vuelo.origen.region}}, {{vuelo.origen.pais}} - {{vuelo.destino.ciudad}}, {{vuelo.destino.region}}, {{vuelo.destino.pais}}</h6>
    <h6>Fecha Ida: {{vuelo.fechaIda | moment("DD/MM/YYYY LT")}}</h6>
    <h6>Fecha Vuelta: {{vuelo.fechaIda | moment("DD/MM/YYYY LT")}}</h6>
    <h6>{{vuelo.clase}}</h6>
    <h6>{{vuelo.nombreAereolinea}} - {{vuelo.valoracionAereolinea}}</h6>
    <h6 v-if="vuelo.conEscala">Vuelo con escalas</h6>
    <h6 v-if="vuelo.accesoDiscapacitados">Acceso a Discapacitados</h6>
    <h5>${{vuelo.precio}}</h5>
    <b-button href="#" variant="primary">Agregar a Reserva</b-button>
  </b-card>
</div>
    </div>
 </div>
</template>

<script>
export default {
  name: "VistaVuelo",
  props: {
    vuelos: null
  },
  methods: {
    init() {
      this.$axios
        .get("https://localhost:57935/api/vuelo/destino/" + this.$parent.destino)
        .then(response => (this.vuelos = response.data));
    }
  },
  mounted() {
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
.color-red{
  color: red;
}
.bv-example-row{
  max-height: 300px;
}
.flight{
  display: inline-block;
  max-width: 15rem;
  margin-right: 20px;
}
</style>