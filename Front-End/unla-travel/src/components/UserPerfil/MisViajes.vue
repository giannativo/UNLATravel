<template>
 <div>
     <h4>Activas</h4>
    <b-card v-for="reserva in reservas" :key="reserva.id"
    img-alt="Image"
    img-top
    tag="flight"
    class="mb-2 flight"
  >
    <h6>Reserva</h6>
    <h6>Vuelo: </h6>
    <h6>Alojamiento: </h6>
    <h6>Paquete: </h6>
    <h6>Actividad: </h6>
    <h5>${{reserva.importe}}</h5>
    <b-button href="#" variant="primary">Ver Reserva</b-button>
  </b-card>
    <h4>Finalizadas</h4>
  <b-card 
    img-alt="Image"
    img-top
    tag="flight"
    class="mb-2 flight"
  >
    <h6>Reserva</h6>
    <h6>Vuelo: </h6>
    <h6>Alojamiento: </h6>
    <h6>Paquete: </h6>
    <h6>Actividad: </h6>
    <h5>$total</h5>
    <b-button href="#" variant="primary">Ver Reserva</b-button>
  </b-card>
</div>
</template>

<script>
export default {
  name: "MisViajes",
  props: {
    reservas: null,
    reservasActivas :null,
    reservasFinalizadas : null
  },
    methods: {
      filtro(reserva){

      return  reserva.reservaFinalizada==false;

    },
    init(){
      this.$axios
      .get("https://localhost:57935/api/reserva/usuario/" + this.$parent.current_user[0].id)
      .then(response => {
        this.reservas = response.data;
        this.reservasActivas = this.reservas.filter(function(reserva) {return reserva.reservaFinalizada == true;});
        this.reservasFinalizadas = this.reservas.filter(function(reserva) {return reserva.reservaFinalizada == false
        ;});
        });
        
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
.filtro{
  border-radius: 23px 23px 23px 23px;
-moz-border-radius: 23px 23px 23px 23px;
-webkit-border-radius: 23px 23px 23px 23px;
border: 0px solid #000000;
background: darkred;
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