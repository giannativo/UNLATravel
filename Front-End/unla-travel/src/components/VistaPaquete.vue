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
    <b-dropdown-item @click="ordenarPorCantidad('mayor')" >Mayor cantidad primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorCantidad('menor')" >Menor cantidad primero</b-dropdown-item>    
  </b-dropdown>       
      
     </div>
   </div>
   </div>
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
    paquetes: null,
    paquetesOriginal:null,
    origen:null,
    destino:null,
    fechaDesde:null,
    fechaHasta:null,
    alojamiento:null,
    tipoPaquete:null
  },
  methods:{
     filtro(paquete){

      return paquete.fechaIda.toString() >= this.fechaDesde.toString() 
      && paquete.fechaVuelta.toString() <=this.fechaHasta.toString() && paquete.alojamiento.nombreAlojamiento == this.alojamiento && this.tipoPaquete == paquete.tipoPaquete;

    },
    submit(){
     this.paquetes=this.paquetesOriginal;
     console.log(this.fechaDesde,this.fechaHasta,this.alojamiento);
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