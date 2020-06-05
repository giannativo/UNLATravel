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
          <b-form-input list="act" v-model="nombreActividad" placeholder="Lugar" ></b-form-input>

          <datalist id="act" >
          <select v-model="destino"   class="form-control">
          <option v-for="actividad in actividadesOriginal" :key="actividad.id" :value="actividad.nombreActividad"></option>
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
          <b-button v-if="allowedToAddActividad" @click="agregarActividadAReserva(actividad)" variant="primary">Agregar a Reserva</b-button>  
        </b-card>
       
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "VistaActividad",
  data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: '5', value: '5 estrellas' },
          { text: '4', value: '4 estrellas' },
          { text: '3', value: '3 estrellas' },
          { text: '2', value: '2 estrellas' },
          {text :'1', value:'1 estrellas'}
        ]
      }
    },
  props: {
    actividades: null,
    fechaDesde: null,
    fechaHasta: null,
    actividadesOriginal: null,
    nombreActividad: null,
    reservaActiva: null,
    allowedToAddActividad: {
      type: Boolean,
      default: false
    }
  },
  methods:{
    filtro(actividad){

      return (actividad.fechaDesde.toString() >= this.fechaDesde || this.fechaDesde == "")
      && (actividad.fechaHasta.toString() <=this.fechaHasta || this.fechaHasta =="") && (actividad.nombreActividad == this.nombreActividad || this.nombreActividad==null);

    },
    submit(){
     this.actividades=this.actividadesOriginal;
     this.actividades = this.actividades.filter(this.filtro);
 
    },
    filtrarPorValoracion(){
  
      this.actividades = this.actividadesOriginal;
      this.actividades = this.actividades.filter(act=>{
        if(this.selected.find(select =>( select == act.valoracion)) != undefined ){
          return true;
        }else{
          false;
        }
      })
    
    },
     ordenarPorValoracion(orden){
       
      switch(orden){
        case 'mayor':
          this.actividades.sort((a, b)=>(this.ordenar(b.valoracion,a.valoracion)));
        break;
        case 'menor':
          this.actividades.sort((a, b)=>(this.ordenar(a.valoracion,b.valoracion)));
          break;


      }
      },
      ordenar(x,y){
      
        if (x < y) {return -1;}
        if (x > y) {return 1;}
        return 0;
      },
      agregarActividadAReserva(actividad){
      if(this.reservaActiva == null){
        this.$axios
          .post('https://localhost:57935/api/reserva', {
            nroReserva: "1",
            usuario: this.$parent.$parent.usuario.Id,
            destino: this.$parent.destino,
            alojamiento: null,
            actividad: actividad.id,
            vuelo: null,
            esUnPaquete: false,
            paquete: null,
            importe: actividad.precio,
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
            actividad: actividad.id,
            vuelo: this.reservaActiva.vuelo,
            esUnPaquete: this.reservaActiva.esUnPaquete,
            paquete: this.reservaActiva.paquete,
            importe: this.reservaActiva.importe + actividad.precio,
            reservaFinalizada: this.reservaActiva.reservaFinalizada
          });
      }
    } 
  },

  mounted() {
    this.$axios
      .get(
        "https://localhost:57935/api/actividad/destino/" + this.$parent.destino
      )
      .then(response => {
        this.actividades = response.data;
        this.actividadesOriginal = this.actividades});
      if(this.$parent.$parent.usuario){
        this.$axios
        .get("https://localhost:57935/api/reserva/usuario/" + this.$parent.$parent.usuario.Id)
        .then(response => {
          this.allowedToAddActividad = true;
          if(response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;}).length > 0){
            this.reservaActiva = response.data.filter(function(reserva) {return reserva.reservaFinalizada == false;})[0];
            if(this.reservaActiva.vuelo != null){
              this.reservaActiva.vuelo = this.reservaActiva.vuelo.id;
            }
            if(this.reservaActiva.alojamiento != null){
              this.reservaActiva.alojamiento = this.reservaActiva.alojamiento.id;
            }
            if(this.reservaActiva.actividad != null || this.reservaActiva.esUnPaquete){
              this.allowedToAddActividad = false;
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