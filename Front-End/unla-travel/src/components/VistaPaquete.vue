<template>
  <div>
    <div  class="my-3 p-3 rounded container">
      <div >
        <b-card v-for="paquete in paquetes" :key="paquete.id"
          title=""
         
          img-alt="Image"
          img-top
          tag="article"
          class="mb-2 flight"
        >
          <h6>Tipo Paquete: {{paquete.tipoPaquete}} </h6>
          <h6>Destino: {{paquete.destino.ciudad}}, {{paquete.destino.region}}, {{paquete.destino.pais}}</h6>
          <h6>Fecha Desde: {{paquete.fechaIda | moment("DD/MM/YYYY LT")}}</h6>
          <h6>Fecha Hasta: {{paquete.fechaVuelta | moment("DD/MM/YYYY LT")}}</h6>
          <h6>Alojamiento: {{paquete.alojamiento.nombreAlojamiento}}</h6>
          <h6>{{paquete.vuelo.id}}</h6>
          <h6>Activiad: {{paquete.actividad.nombreActividad}}</h6>
          <h6>Cantidad Personas: {{paquete.cantidadPersonas}}</h6>
          <h6>Cantidad Habitaciones: {{paquete.habitaciones}}</h6>
          <h6 v-if="paquete.accesoDiscapacitados">Acceso a discapacitados</h6>
          <h6>${{paquete.precio}}</h6>
          
           
          <b-button href="#" variant="primary">Reservar</b-button>
        </b-card>
       
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "VistaPaquete",
  props: {
    paquetes: null
  },
  mounted() {
    this.$axios
      .get(
        "https://localhost:57935/api/paquete/destino/" + this.$parent.destino
      )
      .then(response => (this.paquetes = response.data));
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