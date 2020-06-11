<template>
  <div>
    <div class="container">
     <div class="row d-flex justify-content-center mt-3 filtro">
       <div class="col-9">

   <form>
    
    <div class="form-row p-2">
      
          
      
      <div class="col">
              <datetime
                input-class="form-control"
                format="dd/MM/yyyy T"
                value-zone="UTC-3"
                :min-datetime="currentDate"
                zone="UTC-3"
                type="datetime"
                id="fecha-desde"
                placeholder="Desde"
                v-model="fechaDesde"
                required
              ></datetime>
        
      
      </div>
      <div class="col">
              <datetime
                input-class="form-control"
                format="yyyy/MM/dd T"
                value-zone="UTC-3"
                :min-datetime="currentDate"
                zone="UTC-3"
                type="datetime"
                id="fecha-desde"
                placeholder="Hasta"
                v-model="fechaHasta"
                required
              ></datetime>
      </div>
      <div class="col">
        <b-form-input list="alojamiento" v-model="alojamiento" placeholder="Alojamiento" ></b-form-input>

        <datalist id="alojamiento">
            <select v-model="alojamiento"  class="form-control">
                <option v-for="paquete in paquetesOriginal" :key="paquete.id" :value="paquete.alojamiento.nombreAlojamiento"> </option>
             </select>
         </datalist>
      </div> 
      <div class="col-3">
        
       
        <b-form-input list="paquete" v-model="tipoPaquete" placeholder="Tipo paquete" ></b-form-input>

        <datalist id="paquete">
            <select v-model="tipoPaquete"  class="form-control">
                <option v-for="paquete in paquetesOriginal" :key="paquete.id" :value="paquete.tipoPaquete"> </option>
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
    <div class="row justify-content-end">
     
        <div class="col-3">
        
       <b-dropdown id="dropdown-3" text="Cantidad de personas" class="m-md-2" variant="outline-success">
         <b-dropdown-form>
     <b-form-group label="Cantidad de personas:">
      <b-form-checkbox
        v-for="option in options"
        v-model="selected"
        :key="option.value"
        :value="option.value"
        name="flavour-3a"
        @input="filtroPorCantidadDePersonas"
      >
        {{ option.text }}
      </b-form-checkbox>
    </b-form-group> 
    </b-dropdown-form>   
  </b-dropdown>       
      
     </div>
   </div>
   </div>
    <div v-show="paqueteAgregado" class="alert alert-success" role="alert">
      Paquete agregado!
    </div>
    <div class="my-3 p-3 rounded container">
      <div>
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
          <b-button v-if="allowedToAddPaquete" @click="agregarPaqueteAReserva(paquete)" variant="primary">Agregar a Reserva</b-button>             
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "VistaPaquete",
  props: {
    paquetes: null,
    paquetesOriginal: null,
    origen: null,
    destino: null,
    fechaDesde: null,
    fechaHasta: null,
    alojamiento: null,
    tipoPaquete: null,
    reservaActiva: null,
    allowedToAddPaquete: {
      type: Boolean,
      default: false
    },
    paqueteAgregado: {
      type: Boolean,
      default: false
    }
  },
    data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: '10', value: '10' },
          { text: '9', value: '9' },
           { text: '8', value: '8' },
           { text: '7', value: '7' },
           { text: '6', value: '6' },
            { text: '5', value: '5' },
             { text: '4', value: '4' },
              { text: '3', value: '3' },
               { text: '2', value: '2' },
                { text: '1', value: '1' },
        ]
      }
    },
  methods:{
     filtro(paquete){

      return (paquete.fechaIda.toString() >= this.fechaDesde || this.fechaHasta == "")
      && (paquete.fechaVuelta.toString() <=this.fechaHasta || this.fechaHasta == "") &&  (paquete.alojamiento.nombreAlojamiento == this.alojamiento || this.alojamiento == null) && (this.tipoPaquete == null || this.tipoPaquete == paquete.tipoPaquete);

    },
    filtroPorCantidadDePersonas(){
      
      this.paquetes = this.paquetesOriginal;
      this.paquetes = this.paquetes.filter(paq=>{
        if(this.selected.find(select=>(select == paq.cantidadPersonas)) != undefined)
            return true;
        else
            return false;
      })


    },
    submit(){
     this.paquetes=this.paquetesOriginal;
     console.log(this.fechaDesde,this.fechaHasta,this.alojamiento,this.tipoPaquete);
     this.paquetes = this.paquetes.filter(this.filtro);
 
    },
    ordenarPorCantidad(orden){
      switch(orden){
        case 'mayor':
          this.paquetes.sort(function(a, b){return b.cantidadPersonas - a.cantidadPersonas});
        break;
        case 'menor':
          this.paquetes.sort(function(a, b){return a.cantidadPersonas - b.cantidadPersonas});
          break;


      }
    },
    agregarPaqueteAReserva(paquete){
      if(this.reservaActiva == null){
        this.$axios
          .post('https://localhost:57935/api/reserva', {
            nroReserva: "1",
            usuario: this.$parent.$parent.usuario.Id,
            destino: this.$parent.destino,
            alojamiento: null,
            actividad: null,
            vuelo: null,
            esUnPaquete: true,
            paquete: paquete.id,
            importe: paquete.precio,
            reservaFinalizada: false
          }).then((response) => {
            if (response.status==200){
              this.allowedToAddPaquete = false;
              this.paqueteAgregado = true;
              setTimeout(() => this.paqueteAgregado = false, 2000);
              this.$parent.$parent.showReservation = true;
            }
          });
      }
      else{
        this.$axios
          .put('https://localhost:57935/api/reserva/' + this.reservaActiva.id, {
            id: this.reservaActiva.id,
            nroReserva: this.reservaActiva.nroReserva,
            usuario: this.reservaActiva.usuario.id,
            destino: this.reservaActiva.destino.id,
            alojamiento: this.reservaActiva.alojamiento,
            actividad: this.reservaActiva.actividad,
            vuelo: this.reservaActiva.vuelo,
            esUnPaquete: true,
            paquete: paquete.id,
            importe: paquete.precio,
            reservaFinalizada: this.reservaActiva.reservaFinalizada
          }).then((response) => {
            if (response.status==200){
              this.allowedToAddPaquete = false;
              this.paqueteAgregado = true;
              setTimeout(() => this.paqueteAgregado = false, 2000)
            }
          });
      }
    } 
  },
  mounted() {
    this.$axios
      .get(
        "https://localhost:57935/api/paquete/destino/" + this.$parent.destino
      )
      .then(response => {
        this.paquetes = response.data;
        this.paquetesOriginal = this.paquetes;});
    if(this.$parent.$parent.usuario){
        this.$axios
        .get("https://localhost:57935/api/reserva/usuario/" + this.$parent.$parent.usuario.Id)
        .then(response => {
          this.allowedToAddPaquete = true;
          if(response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;}).length > 0){
            this.reservaActiva = response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;})[0];
            this.$parent.$parent.showReservation = true;
            this.$parent.$parent.reserva = this.reservaActiva;
            if(this.reservaActiva.actividad != null || this.reservaActiva.vuelo != null 
            || this.reservaActiva.alojamiento != null || this.reservaActiva.paquete != null){
              this.allowedToAddPaquete = false;
            }
          }
        });    
      }
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