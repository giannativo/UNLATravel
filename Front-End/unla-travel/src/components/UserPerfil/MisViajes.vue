<template>
  <div>
    <div v-if="showList" >
      <h4 class="">Activas</h4>
      <div class="d-flex justify-content-center">
      
      <b-card
        v-for="reserva in reservasActivas"
        :key="reserva.id"
        img-alt="Image"
        img-top
        tag="flight"
        class="mb-2 flight"
      >
        <h6>Numero Reserva: {{reserva.nroReserva}}</h6>
        <h6>Destino: {{reserva.destino.pais}}, {{reserva.destino.region}}, {{reserva.destino.ciudad}}</h6>
        <h6 v-if="reserva.esUnPaquete">NroVuelo:{{reserva.paquete.vuelo.id}}</h6>
        <h6 v-else>NroVuelo:{{reserva.vuelo.id}}</h6>
        <h6
          v-if="reserva.esUnPaquete== true"
        >Alojamiento: {{reserva.paquete.alojamiento.nombreAlojamiento}}</h6>
        
        <h6
          v-if="reserva.esUnPaquete== true"
        >Actividad: {{reserva.paquete.actividad.nombreActividad}}</h6>
        <h6 v-else>Actividad: {{reserva.actividad.nombreActividad}}</h6>
        <h5>${{reserva.importe}}</h5>
        <b-button @click="cargaReserva(reserva)" href="#" variant="primary">Ver Reserva</b-button>
      </b-card>
     </div>
      <h4>Finalizadas</h4>
      <div class="d-flex justify-content-center">
      <b-card
        v-for="reserva in reservasFinalizadas"
        :key="reserva.id"
        img-alt="Image"
        img-top
        tag="flight"
        class="mb-2 flight"
      >
        <h6>Numero Reserva: {{reserva.nroReserva}}</h6>
        <h6>Destino: {{reserva.destino.pais}}, {{reserva.destino.region}}, {{reserva.destino.ciudad}}</h6>
        <h6 v-if="reserva.esUnPaquete">NroVuelo:{{reserva.paquete.vuelo.id}}</h6>
        <h6 v-else>NroVuelo:{{reserva.vuelo.id}}</h6>
        <h6
          v-if="reserva.esUnPaquete== true"
        >Alojamiento: {{reserva.paquete.alojamiento.nombreAlojamiento}}</h6>
        <h6>Paquete:</h6>
        <h6
          v-if="reserva.esUnPaquete== true"
        >Actividad: {{reserva.paquete.actividad.nombreActividad}}</h6>
        <h6 v-else>Actividad: {{reserva.actividad.nombreActividad}}</h6>
        <h5>${{reserva.importe}}</h5>
        <b-button @click="cargaReserva(reserva)" href="#" variant="primary">Ver Reserva</b-button>
      </b-card>
      </div>
      <br />
      <div class="row">
        <div class="options text-center">
          <button
            @click="volver"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Volver</button>
        </div>
      </div>
    </div>

    <div v-if="showDetalle">
      <main role="main" class="container">
        <div class="d-flex align-items-start flex-column p-3 my-3 bg-purple rounded box-shadow">
          <h1>Número Reserva: {{reservaSeleccionada.nroReserva}}</h1>
          <h3>Destino: {{reservaSeleccionada.destino.pais}}, {{reservaSeleccionada.destino.region}}, {{reservaSeleccionada.destino.ciudad}}</h3>
          <h3 v-if="reservaSeleccionada.paquete!=null">Tipo de Paquete: {{reservaSeleccionada.paquete.tipoPaquete}}</h3>
          <h3>Total: ${{reservaSeleccionada.importe}}</h3>
        </div>
        <div v-if="reservaSeleccionada.paquete==null">
          <div v-if="reservaSeleccionada.vuelo!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Vuelo</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Fecha Ida</th>
                    <th>Fecha Vuelta</th>
                    <th>Clase</th>
                    <th>Con Escala</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Aereolinea</th>
                    <th>Precio</th>
                    <th>Valoración Aereolinea</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.vuelo.origen.pais}}, {{reservaSeleccionada.vuelo.origen.region}}, {{reservaSeleccionada.vuelo.origen.ciudad}}</td>
                    <td>{{reservaSeleccionada.vuelo.destino.pais}}, {{reservaSeleccionada.vuelo.destino.region}}, {{reservaSeleccionada.vuelo.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.vuelo.fechaIda}}</td>
                    <td>{{reservaSeleccionada.vuelo.fechaVuelta}}</td>
                    <td>{{reservaSeleccionada.vuelo.clase}}</td>
                    <td>{{reservaSeleccionada.vuelo.conEscala}}</td>
                    <td>{{reservaSeleccionada.vuelo.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.vuelo.nombreAereolinea}}</td>
                    <td>{{reservaSeleccionada.vuelo.precio}}</td>
                    <td>{{reservaSeleccionada.vuelo.valoracionAereolinea}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div v-if="reservaSeleccionada.alojamiento != null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Alojamiento</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Alojamiento</th>
                    <th>Destino</th>
                    <th>Tipo Alojamiento</th>
                    <th>Tipo Habitación</th>
                    <th>Tipo Régimen</th>
                    <th>Tipo Servicio</th>
                    <th>Estrellas</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Precio</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.alojamiento.nombreAlojamiento}}</td>
                    <td>{{reservaSeleccionada.alojamiento.destino.pais}}, {{reservaSeleccionada.alojamiento.destino.region}}, {{reservaSeleccionada.alojamiento.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.alojamiento.tipoAlojamiento.descripcion}}</td>
                    <td>{{reservaSeleccionada.alojamiento.tipoHabitacion}}</td>
                    <td>{{reservaSeleccionada.alojamiento.tipoRegimen.descripcion}}</td>
                    <td>{{reservaSeleccionada.alojamiento.tipoServicio}}</td>
                    <td>{{reservaSeleccionada.alojamiento.cantidadEstrellas}}</td>
                    <td>{{reservaSeleccionada.alojamiento.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.alojamiento.precio}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div v-if="reservaSeleccionada.actividad!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Actividad</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Actividad</th>
                    <th>Destino</th>
                    <th>Descripcion</th>
                    <th>Fecha Desde</th>
                    <th>Fecha Hasta</th>
                    <th>Franja Horaria</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Valoracion</th>
                    <th>Precio</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.actividad.nombreActividad}}</td>
                    <td>{{reservaSeleccionada.actividad.destino.pais}}, {{reservaSeleccionada.actividad.destino.region}}, {{reservaSeleccionada.actividad.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.actividad.descripcion}}</td>
                    <td>{{reservaSeleccionada.actividad.fechaDesde}}</td>
                    <td>{{reservaSeleccionada.actividad.fechaHasta}}</td>
                    <td>{{reservaSeleccionada.actividad.franjaHoraria}}</td>
                    <td>{{reservaSeleccionada.actividad.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.actividad.valoracion}}</td>
                    <td>{{reservaSeleccionada.actividad.precio}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
          <div v-if="reservaSeleccionada.paquete!=null">
          <div v-if="reservaSeleccionada.paquete.vuelo!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Vuelo</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Origen</th>
                    <th>Destino</th>
                    <th>Fecha Ida</th>
                    <th>Fecha Vuelta</th>
                    <th>Clase</th>
                    <th>Con Escala</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Aereolinea</th>
                    <th>Precio</th>
                    <th>Valoración Aereolinea</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.paquete.vuelo.origen.pais}}, {{reservaSeleccionada.paquete.vuelo.origen.region}}, {{reservaSeleccionada.paquete.vuelo.origen.ciudad}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.destino.pais}}, {{reservaSeleccionada.paquete.vuelo.destino.region}}, {{reservaSeleccionada.paquete.vuelo.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.fechaIda}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.fechaVuelta}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.clase}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.conEscala}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.nombreAereolinea}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.precio}}</td>
                    <td>{{reservaSeleccionada.paquete.vuelo.valoracionAereolinea}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div v-if="reservaSeleccionada.paquete.alojamiento!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Alojamiento</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Alojamiento</th>
                    <th>Destino</th>
                    <th>Tipo Alojamiento</th>
                    <th>Tipo Habitación</th>
                    <th>Tipo Régimen</th>
                    <th>Tipo Servicio</th>
                    <th>Estrellas</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Precio</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.paquete.alojamiento.nombreAlojamiento}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.destino.pais}}, {{reservaSeleccionada.paquete.alojamiento.destino.region}}, {{reservaSeleccionada.paquete.alojamiento.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.tipoAlojamiento.descripcion}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.tipoHabitacion}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.tipoRegimen.descripcion}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.tipoServicio}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.cantidadEstrellas}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.paquete.alojamiento.precio}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div v-if="reservaSeleccionada.paquete.actividad!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Actividad</h2>
              <table class="table">
                <thead>
                  <tr>
                    <th>Actividad</th>
                    <th>Destino</th>
                    <th>Descripcion</th>
                    <th>Fecha Desde</th>
                    <th>Fecha Hasta</th>
                    <th>Franja Horaria</th>
                    <th>Acceso a Discapacitados</th>
                    <th>Valoracion</th>
                    <th>Precio</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>{{reservaSeleccionada.paquete.actividad.nombreActividad}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.destino.pais}}, {{reservaSeleccionada.paquete.actividad.destino.region}}, {{reservaSeleccionada.paquete.alojamiento.destino.ciudad}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.descripcion}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.fechaDesde}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.fechaHasta}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.franjaHoraria}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.accesoDiscapacitados}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.valoracion}}</td>
                    <td>{{reservaSeleccionada.paquete.actividad.precio}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        

        <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
          <h2>Pasajeros</h2>

          <table class="table">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>DNI</th>
                <th>Nacionalidad</th>
                <th>Email</th>
                <th>Teléfono</th>
                <th>Domicilio</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{{reservaSeleccionada.usuario.nombre}}</td>
                <td>{{reservaSeleccionada.usuario.apellido}}</td>
                <td>{{reservaSeleccionada.usuario.dni}}</td>
                <td>{{reservaSeleccionada.usuario.nacionalidad}}</td>
                <td>{{reservaSeleccionada.usuario.mail}}</td>
                <td>{{reservaSeleccionada.usuario.telefono}}</td>
                <td>{{reservaSeleccionada.usuario.domicilio}}</td>
              </tr>
              <tr v-for="pasajero in pasajerosSeleccionados" :key="pasajero.id">
                <td>{{pasajero.nombre}}</td>
                <td>{{pasajero.apellido}}</td>
                <td>{{pasajero.dni}}</td>
                <td>{{pasajero.nacionalidad}}</td>
                <td>{{pasajero.mail}}</td>
                <td>{{pasajero.telefono}}</td>
                <td>{{pasajero.domicilio}}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
      <div showMenu class="row">
        <div class="options text-center">
          <button
            @click="listaReservas"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Volver</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MisViajes",
  props: {
    reservas: null,
    reservasActivas: null,
    reservasFinalizadas: null,
    reservaSeleccionada: null,
    pasajerosSeleccionados: null,

    showList: {
      type: Boolean,
      default: true
    },

    showDetalle: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    cargaReserva(reserva) {
      this.showList = false;
      this.showDetalle = true;
      this.reservaSeleccionada = reserva;
      this.pasajerosSeleccionados = reserva.pasajeros;
    },
    listaReservas() {
      this.showDetalle = false;
      this.showList = true;
    },
    init() {
      this.$axios
        .get(
          "https://localhost:57935/api/reserva/usuario/" +
            this.$parent.current_user[0].id
        )
        .then(response => {
          this.reservas = response.data;
          this.reservasActivas = this.reservas.filter(function(reserva) {
            return reserva.reservaFinalizada == false;
          });
          this.reservasFinalizadas = this.reservas.filter(function(reserva) {
            return reserva.reservaFinalizada == true;
          });
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
  max-width: 1500px;
}
.fondo {
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
.btn-primary {
  color: #fff;
  background-color: darkred;
  border-color: black;
}
.lh-condensed {
  line-height: 1.25;
}
.btn-primary {
  color: #fff;
  background-color: darkred;
  border-color: black;
}
</style>