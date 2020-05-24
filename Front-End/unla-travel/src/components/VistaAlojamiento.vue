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
          <b-form-input list="act" v-model="nombreAlojamiento" placeholder="alojamiento" ></b-form-input>

          <datalist id="act" >
          <select v-model="destino"   class="form-control">
          <option v-for="alojamiento in alojamientosOriginal" :key="alojamiento.id" :value="alojamiento.nombrealojamiento"></option>
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
   <div class="row justify-content-center">
     
     <div class="col">
        
       <b-dropdown id="dropdown-1" text="Tipo habitacion" class="m-md-2" variant="outline-success">
    <b-dropdown-item @click="ordenarPorValoracion('mayor')" >Mayor valoracion primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorValoracion('menor')" >Menor valoracion primero</b-dropdown-item>    
  </b-dropdown>       
      
     </div>
      <div class="col">
        
       <b-dropdown id="dropdown-2" text="Tipo servicio" class="m-md-2" variant="outline-success">
    <b-dropdown-item @click="ordenarPorValoracion('mayor')" >Mayor valoracion primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorValoracion('menor')" >Menor valoracion primero</b-dropdown-item>    
  </b-dropdown>       
      
     </div>
     <div class="col">
        
       <b-dropdown id="dropdown-3" text="Tipo regimen" class="m-md-2" variant="outline-success">
    <b-dropdown-item @click="ordenarPorValoracion('mayor')" >Mayor valoracion primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorValoracion('menor')" >Menor valoracion primero</b-dropdown-item>    
  </b-dropdown>       
      
     </div>
      <div class="col">
        
       <b-dropdown id="dropdown-4" text="Cantidad estrellas" class="m-md-2" variant="outline-success">
    <b-dropdown-item @click="ordenarPorValoracion('mayor')" >Mayor valoracion primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorValoracion('menor')" >Menor valoracion primero</b-dropdown-item>    
  </b-dropdown>       
      
     </div>
     <div class="col">
        
       <b-dropdown id="dropdown-5" text="Tipo habitacion" class="m-md-2" variant="outline-success">
    <b-dropdown-item @click="ordenarPorValoracion('mayor')" >Mayor valoracion primero</b-dropdown-item>
    <b-dropdown-item @click="ordenarPorValoracion('menor')" >Menor valoracion primero</b-dropdown-item>    
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
    <b-button href="#" variant="primary">Agregar a Reserva</b-button>
  </b-card>
</div>
    </div>
 </div>
</template>

<script>
export default {
  name: "VistaAlojamiento",
  props: {
    alojamientos: null,
    fechaDesde:null,
    fechaHasta:null,
    alojamientosOriginal:null,
    nombreAlojamiento:null
  },
  methods: {
    init() {
      this.$axios
        .get("https://localhost:57935/api/alojamiento/destino/" + this.$parent.destino)
        .then(response => {
          this.alojamientos = response.data;
          this.alojamientosOriginal=this.alojamientos;});
    }, filtro(alojamiento){

      return alojamiento.fechaDesde.toString() >= this.fechaDesde.toString() 
      && alojamiento.fechaHasta.toString() <=this.fechaHasta.toString() && alojamiento.nombreAlojamiento == this.nombrealojamiento;

    },
    submit(){
     this.alojamientos=this.alojamientosOriginal;
     this.alojamientos = this.alojamientos.filter(this.filtro);
 
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