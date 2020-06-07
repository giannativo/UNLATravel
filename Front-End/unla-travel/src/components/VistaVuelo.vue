<template>
 <div>
   <div class="container">
     <div class="row d-flex justify-content-center mt-3 filtro">
       <div class="col-9">

   <form>
     <div class="form-row p-2">
       <div class="col">
         <p  style="color:white;">Vuelos</p>
       </div>
       <div class="col">

       <input class="form-check-input" type="radio" v-model="idaVuelta" :value="true" name="inlineRadioOptions" id="inlineRadio1">
       <label class="form-check-label" for="inlineRadio1" style="color:white;">Ida y vuelta</label>

       </div>
       <div class="col">

       <input class="form-check-input" type="radio" v-model="idaVuelta" :value="false" name="inlineRadioOptions" id="inlineRadio2" >
       <label class="form-check-label" for="inlineRadio2"  style="color:white;">Ida</label>
       
       </div>
       <div class="col">

       <input class="form-check-input" type="radio" v-model="escala" :value="false" name="escalaOptions" id="escalaRadio1">
       <label class="form-check-label" for="escalaRadio1"  style="color:white;">Directo</label>

       </div>
       <div class="col">

       <input class="form-check-input" type="radio" v-model="escala" :value="true" name="escalaOptions" id="escalaRadio2" >
       <label class="form-check-label" for="escalaRadio2"  style="color:white;">Con escala</label>
       
       </div>
     </div>
    <div class="form-row p-2">
      <div class="col">        
       
    
  <b-form-input list="origen" v-model="origen" placeholder="Origen"></b-form-input>

  <datalist id="origen" > 
    <select v-model="origen"  class="form-control"> 
    <option v-for="vuelo in vuelos" :key="vuelo.id" :value="vuelo.origen.ciudad">{{vuelo.origen.region}} </option>
    </select>
  </datalist>


      </div>
      <div class="col">
        <b-form-input list="destino" v-model="destino" placeholder="Destino"></b-form-input>

        <datalist id="destino">
            <select v-model="destino"  class="form-control">
                <option v-for="vueloDestino in vuelos" :key="vueloDestino.id" :value="vueloDestino.destino.ciudad">{{ vueloDestino.destino.region }} </option>
             </select>
         </datalist>
      </div>
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
        <button type="button" class="btn btn-success" @click="submit" >Buscar</button>
        

        
      </div>
     
    </div>
    
</form>
   </div>
   </div>
   <div class="row justify-content-end">
     
     <div class="col-2">
        
       <b-dropdown id="dropdown-1" text="Valoracion" class="m-md-2" variant="outline-success">
    <b-dropdown-form>
       <b-form-group label="Estrellas:">
      <b-form-checkbox
        v-for="option in options"
        v-model="selected"
        :key="option.value"
        :value="option.value"
        name="flavour-3a"
        @input="filtrar"
      >
        {{ option.text }}
      </b-form-checkbox>
    </b-form-group>
    </b-dropdown-form>        
  </b-dropdown>       
      
     </div>
    
        
  <div class="col-2">
        
       <b-dropdown id="dropdown-2" text="Clase" class="m-md-2" variant="outline-success">
    <b-dropdown-form>
       <b-form-group label="Selecciona las clases:">
      <b-form-checkbox
        v-for="clase in clases"
        v-model="clasesSeleccionadas"
        :key="clase.value"
        :value="clase.value"
        name="clases"
        @input="filtrar"
      >
        {{ clase.text }}
      </b-form-checkbox>
    </b-form-group>
    </b-dropdown-form>      
  </b-dropdown>       
      
     </div>
    
  
      
     </div>
  
   </div>

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
    <h6>Fecha Vuelta: {{vuelo.fechaVuelta | moment("DD/MM/YYYY LT")}}</h6>
    <h6>{{vuelo.clase}}</h6>
  
    <h6>{{vuelo.nombreAereolinea}} - {{vuelo.valoracionAereolinea}}</h6>
    <h6 v-if="vuelo.conEscala">Vuelo con escalas</h6>
    <h6 v-if="vuelo.accesoDiscapacitados">Acceso a Discapacitados</h6>
    <h5>${{vuelo.precio}}</h5>
    <b-button v-if="allowedToAddVuelo" @click="agregarVueloAReserva(vuelo)" variant="primary">Agregar a Reserva</b-button>  
  </b-card>
</div>
    </div>
 </div>
</template>

<script>
export default {
  name: "VistaVuelo",
  props: {
    vuelos: null,
    origen: null,
    destino: null,
    fechaDesde: null,
    fechaHasta: null,
    escala: null,
    directo: null,
    ida: null,
    idaVuelta: null,
    vuelosOriginal: null,
    reservaActiva: null,
    allowedToAddVuelo: {
      type: Boolean,
      default: false
    }
  },
  data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: '5', value: '5' },
          { text: '4', value: '4' },
          { text: '3', value: '3'},
          { text: '2', value: '2' },
          { text: '1', value: '1' }
        ],
        clasesSeleccionadas:[],
        clases:[
          { text: 'Economica', value: 'Económica' },
          { text: 'Primera clase', value: 'Primera clase' },
          {text:  'Ejecutivo', value:'Ejecutivo'}

        ]
      }
    },
  methods: {
   async init() {
      this.$axios
        .get("https://localhost:57935/api/vuelo/destino/" + this.$parent.destino)
        .then(response => {
          this.vuelos = response.data;
          this.vuelosOriginal = this.vuelos;});
      if(this.$parent.$parent.usuario){
        this.$axios
        .get("https://localhost:57935/api/reserva/usuario/" + this.$parent.$parent.usuario.Id)
        .then(response => {
          this.allowedToAddVuelo = true;
          if(response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;}).length > 0){
            this.reservaActiva = response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;})[0];
            this.$parent.$parent.showReservation = true;
            this.$parent.$parent.reserva = this.reservaActiva;
            if(this.reservaActiva.alojamiento != null){
              this.reservaActiva.alojamiento = this.reservaActiva.alojamiento.id;
            }
            if(this.reservaActiva.actividad != null){
              this.reservaActiva.actividad = this.reservaActiva.actividad.id;
            }
            if(this.reservaActiva.vuelo != null || this.reservaActiva.esUnPaquete){
              this.allowedToAddVuelo = false;
            }
          }
        });    
      }
    },
    
    filtro(vuelo){

      return (vuelo.origen.ciudad == this.origen || this.origen == null) && (vuelo.destino.ciudad == this.destino || this.destino == null) && (vuelo.fechaIda.toString() >= this.fechaDesde || this.fechaDesde == "") 
      && (vuelo.fechaVuelta.toString() <=this.fechaHasta || this.fechaHasta =="") &&  ((this.idaVuelta && vuelo.fechaVuelta != null || this.idaVuelta== null ) || (!this.idaVuelta && vuelo.fechaVuelta== null) || this.idaVuelta== null ) && (vuelo.conEscala == this.escala || this.escala == null);

    },
    submit(){
   
     this.vuelos=this.vuelosOriginal;
     this.vuelos = this.vuelos.filter(this.filtro);
 
    },
    filtrar(){
      this.vuelos = this.vuelosOriginal;
       if(this.selected.length >0)
            this.filtrarPorValoracion(); 
       if(this.clasesSeleccionadas.length >0)
            this.filtrarClase();
      

    },
    filtrarPorValoracion(){
      
      this.vuelos = this.vuelos.filter(vuelo=>{
        if(this.selected.find(select =>( select == vuelo.valoracionAereolinea)) != undefined )
          return true;
        else
          false;
        
      })
    
    },
    filtrarClase(){
       this.vuelos = this.vuelos.filter(vuelo=>{
        if(this.clasesSeleccionadas.find(select =>( select == vuelo.clase)) != undefined )
          return true;
        else
          false;
        
      })

    },
  
    
    ordenarPorValoracion(orden){
      switch(orden){
        case 'mayor':
          this.vuelos.sort(function(a, b){return b.valoracionAereolinea - a.valoracionAereolinea});
        break;
        case 'menor':
          this.vuelos.sort(function(a, b){return a.valoracionAereolinea - b.valoracionAereolinea});
          break;


      }
    },
    ordenarPorClase(orden){

      
      switch(orden){
        case 'mayor':
          this.vuelos.sort((a,b)=>(this.ordenar(a.clase,b.clase)));
        break;
        case 'menor':
          this.vuelos.sort((a,b)=>(this.ordenar(b.clase,a.clase)));
          break;


      }

    },
    ordenar(x,y){
      
        if (x < y) {return -1;}
        if (x > y) {return 1;}
        return 0;
    },
    agregarVueloAReserva(vuelo){
      if(this.reservaActiva == null){
        this.$axios
          .post('https://localhost:57935/api/reserva', {
            nroReserva: "1",
            usuario: this.$parent.$parent.usuario.Id,
            destino: this.$parent.destino,
            alojamiento: null,
            actividad: null,
            vuelo: vuelo.id,
            esUnPaquete: false,
            paquete: null,
            importe: vuelo.precio,
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
            alojamiento: this.reservaActiva.alojamiento,
            actividad: this.reservaActiva.actividad,
            vuelo: vuelo.id,
            esUnPaquete: this.reservaActiva.esUnPaquete,
            paquete: this.reservaActiva.paquete,
            importe: this.reservaActiva.importe + vuelo.precio,
            reservaFinalizada: this.reservaActiva.reservaFinalizada
          });
      }
    }  
  },
 async mounted() {
   await this.init();
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