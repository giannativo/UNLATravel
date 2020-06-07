<template>
 <div>
   <div class="container">
     <div class="row d-flex justify-content-center mt-3 filtro">
       <div class="col-9">

   <form>
    
    <div class="form-row p-2">
      
     <div class="col">
  <b-form-input list="alojamiento" v-model="tipoAlojamiento" placeholder="Tipo alojamiento"></b-form-input>

          <datalist id="alojamiento">
          <select v-model="tipoAlojamiento" class="form-control">
          <option v-for="alojamiento in alojamientosOriginal" :key="alojamiento.id" :value="alojamiento.tipoAlojamiento.descripcion"></option>
          </select>
          </datalist>        
      
     </div>
      <div class="col"> 

      <b-form-input list="serv" v-model="servicio" placeholder="Tipo servicio"></b-form-input>

          <datalist id="serv">
          <select v-model="servicio" class="form-control">
          <option v-for="alojamiento in alojamientosOriginal" :key="alojamiento.id" :value="alojamiento.tipoServicio"></option>
          </select>
          </datalist>        
      
     </div>
     <div class="col">
       <b-form-input list="regimen" v-model="regimen" placeholder="Tipo regimen" ></b-form-input>

          <datalist id="regimen" >
          <select v-model="regimen" class="form-control">
          <option v-for="alojamiento in alojamientosOriginal" :key="alojamiento.id" :value="alojamiento.tipoRegimen.descripcion"></option>
          </select>
          </datalist>      
      
     </div>
      
     <div class="col">
        
          <b-form-input list="hab" v-model="habitacion" placeholder="Tipo habitacion" ></b-form-input>

          <datalist id="hab" >
          <select v-model="habitacion"   class="form-control">
          <option v-for="alojamiento in alojamientosOriginal" :key="alojamiento.id" :value="alojamiento.tipoHabitacion"></option>
          </select>
          </datalist>       
      
     </div>     
      <div class="col">
        <button type="button" class="btn btn-success" @click="submit" >Buscar</button>
      </div>
     
    </div>
    
</form>
   </div>
   </div>
   <div class="row d-flex justify-content-end ">
     
      <div class="col-3">
        
     <b-dropdown id="dropdown-4" text="Cantidad estrellas" class="m-md-2" variant="outline-success">
    <b-dropdown-form> 
       <b-form-group label="Estrellas:">
      <b-form-checkbox
        v-for="option in options"
        v-model="selected"
        :key="option.value"
        :value="option.value"
        name="flavour-3a"
        @input="filtrarPorValoracion"
      >
        {{ option.text }}
      </b-form-checkbox>
    </b-form-group>
    </b-dropdown-form>      
      </b-dropdown>       
      
     </div>
   
   </div>
   </div>
    <div class="my-3 p-3 rounded container">   
    <div>
  <b-card v-for="alojamiento in alojamientos" :key="alojamiento.id"
    :title="alojamiento.nombreAlojamiento"
    img-src="https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/21/90/219001_v5.jpeg"
    img-alt="Image"
    img-top
    tag="flight"
    class="mb-2 flight"
  >
    <h6>{{alojamiento.destino.ciudad}}, {{alojamiento.destino.region}}, {{alojamiento.destino.pais}}</h6>
    <h6>{{alojamiento.cantidadEstrellas}} estrellas</h6>
    <h6>Tipo: {{alojamiento.tipoServicio}}</h6>
    <h6>Habitacion: {{alojamiento.tipoHabitacion}}</h6>
    <h6>Tipo: {{alojamiento.tipoAlojamiento.descripcion}}</h6>
    <h6>Regimen: {{alojamiento.tipoRegimen.descripcion}}</h6>
    <h6 v-if="alojamiento.accesoDiscapacitados">Acceso a Discapacitados</h6>
    <h5>${{alojamiento.precio}}</h5>
    <b-button v-if="allowedToAddAlojamiento" @click="agregarAlojamientoAReserva(alojamiento)" variant="primary">Agregar a Reserva</b-button>  
  </b-card>
</div>
    </div>
 </div>
</template>

<script>
export default {
  name: "VistaAlojamiento",
   data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: '5', value: '5' },
          { text: '4', value: '4' },
          { text: '3', value: '3' },
          { text: '2', value: '2' },
          {text :'1', value:'1'}
        ]
      }
    },
  props: {
    alojamientos: null,
    fechaDesde: null,
    fechaHasta: null,
    alojamientosOriginal: null,
    nombreAlojamiento: null,
    habitacion: null,
    regimen: null,
    servicio: null,
    tipoAlojamiento: null,
    reservaActiva: null,
    allowedToAddAlojamiento: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    init() {
      this.$axios
        .get("https://localhost:57935/api/alojamiento/destino/" + this.$parent.destino)
        .then(response => {
          this.alojamientos = response.data;
          this.alojamientosOriginal=this.alojamientos;});
      if(this.$parent.$parent.usuario){
        this.$axios
        .get("https://localhost:57935/api/reserva/usuario/" + this.$parent.$parent.usuario.Id)
        .then(response => {
          this.allowedToAddAlojamiento = true;
          if(response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;}).length > 0){
            this.reservaActiva = response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;})[0];
            this.$parent.$parent.showReservation = true;
            this.$parent.$parent.reserva = this.reservaActiva;
            if(this.reservaActiva.vuelo != null){
              this.reservaActiva.vuelo = this.reservaActiva.vuelo.id;
            }
            if(this.reservaActiva.actividad != null){
              this.reservaActiva.actividad = this.reservaActiva.actividad.id;
            }
            if(this.reservaActiva.alojamiento != null || this.reservaActiva.esUnPaquete){
              this.allowedToAddAlojamiento = false;
            }
          }
        });    
      }
    }, filtro(alojamiento){

      return  (alojamiento.tipoServicio == this.servicio || this.servicio == null) && (alojamiento.tipoRegimen.descripcion ==this.regimen || this.regimen == null) &&
       (alojamiento.tipoHabitacion == this.habitacion || this.habitacion == null)  && (alojamiento.tipoAlojamiento.descripcion == this.tipoAlojamiento || this.tipoAlojamiento == null );

    },
    filtrarPorValoracion(){
  
      this.alojamientos = this.alojamientosOriginal;
      this.alojamientos = this.alojamientos.filter(aloj=>{
        if(this.selected.find(select =>( select == aloj.cantidadEstrellas)) != undefined )
          return true;
        else
          false;
        
      })
    
    },
    submit(){
     this.alojamientos=this.alojamientosOriginal;
     console.log(this.servicio,this.tipoAlojamiento,this.habitacion,this.regimen);
     this.alojamientos = this.alojamientos.filter(this.filtro);
 
    },
    ordenarPorValoracion(orden){
      switch(orden){
        case 'mayor':
          this.alojamientos.sort(function(a, b){return b.cantidadEstrellas - a.cantidadEstrellas});
        break;
        case 'menor':
          this.alojamientos.sort(function(a, b){return a.cantidadEstrellas - b.cantidadEstrellas});
          break;


      }
    },
    agregarAlojamientoAReserva(alojamiento){
      if(this.reservaActiva == null){
        this.$axios
          .post('https://localhost:57935/api/reserva', {
            nroReserva: "1",
            usuario: this.$parent.$parent.usuario.Id,
            destino: this.$parent.destino,
            alojamiento: alojamiento.id,
            actividad: null,
            vuelo: null,
            esUnPaquete: false,
            paquete: null,
            importe: alojamiento.precio,
            reservaFinalizada: false
          });
      }
      else{
        this.$axios
          .put('https://localhost:57935/api/reserva/' + this.reservaActiva.id, {
            id: this.reservaActiva.id,
            nroReserva: this.reservaActiva.nroReserva,
            usuario: this.reservaActiva.usuario.id,
            destino: this.reservaActiva.destino.id,
            alojamiento: alojamiento.id,
            actividad: this.reservaActiva.actividad,
            vuelo: this.reservaActiva.vuelo,
            esUnPaquete: this.reservaActiva.esUnPaquete,
            paquete: this.reservaActiva.paquete,
            importe: this.reservaActiva.importe + alojamiento.precio,
            reservaFinalizada: this.reservaActiva.reservaFinalizada
          });
      }
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