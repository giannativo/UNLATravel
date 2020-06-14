<template>
  <div>
      <div v-if="showDetalle">
      <main role="main" class="container">
        <div class="d-flex align-items-start flex-column p-3 my-3 bg-purple rounded box-shadow">
          <h1>Número Reserva: {{reservaSeleccionada.nroReserva}}</h1>
          <h3>Destino: {{reservaSeleccionada.destino.pais}}, {{reservaSeleccionada.destino.region}}, {{reservaSeleccionada.destino.ciudad}}</h3>
          <h3
            v-if="reservaSeleccionada.paquete!=null"
          >Tipo de Paquete: {{reservaSeleccionada.paquete.tipoPaquete}}</h3>
          <h3>Total: ${{reservaSeleccionada.importe}}</h3>
        </div>
        <div v-if="reservaSeleccionada.paquete==null">
          <div v-if="reservaSeleccionada.vuelo!=null">
            <div class="d-flex align-items-start flex-column my-3 p-3 bg-white rounded box-shadow">
              <h2>Vuelo</h2>
              <button @click="eliminarVuelo()" class="btn">
                <i class="fa fa-trash"></i>
              </button>
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
              <button @click="eliminarAlojamiento()" class="btn">
                <i class="fa fa-trash"></i>
              </button>
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
              <button @click="eliminarActividad()" class="btn">
                <i class="fa fa-trash"></i>
              </button>
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
          <button v-if="reservaSeleccionada.reservaFinalizada==false" @click="vistaAgregarPasajero()" class="btn">
                    <i class="fa fa-plus-circle"></i>
                  </button>

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
                <th v-if="reservaSeleccionada.reservaFinalizada==false">Editar</th>
                <th v-if="reservaSeleccionada.reservaFinalizada==false">Eliminar</th>
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
                <td>
                  <button v-if="reservaSeleccionada.reservaFinalizada==false" @click="vistaModificarPasajero(pasajero)" class="btn">
                    <i class="fas fa-edit"></i>
                  </button>
                </td>

                <td>
                  <button v-if="reservaSeleccionada.reservaFinalizada==false" @click="eliminarPasajero(pasajero)" class="btn">
                    <i class="fa fa-trash"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
      <div showMenu class="row">
        <div class="options text-center">
          <button
            @click="volverMenu"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Volver</button>
          <button v-if="reservaSeleccionada.reservaFinalizada==false"
            @click="confirmarReserva"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Confirmar Reserva</button>
          <button v-if="reservaSeleccionada.reservaFinalizada==false"
            @click="eliminarReserva"
            type="button"
            class="btn btn-lg btn-block btn-primary"
          >Eliminar Reserva</button>
        </div>
      </div>
      
    </div>
    <div v-if="showEditarPasajero">
      <div class="text-center">
        <h4 class="mb-3">Ingrese sus datos personales</h4>
        <div class="row options">
          <div class="options text-center">
            <form class="needs-validation" novalidate>
              <div class="row options">
                <div>
                  <label for="dni">DNI</label>
                  <input type="text" class="form-control" id="dni" v-model="pasajeroToEdit.dni" required />
                  <p v-if="dniAlert" class="color-red">{{dniMessage}}</p>

                  <label for="nombre">Nombre</label>
                  <input type="text" class="form-control" id="nombre" v-model="pasajeroToEdit.nombre" required />
                  <p v-if="nombreAlert" class="color-red">{{nombreMessage}}</p>

                  <label for="apellido">Apellido</label>
                  <input type="text" class="form-control" id="apellido" v-model="pasajeroToEdit.apellido" required />
                  <p v-if="apellidoAlert" class="color-red">{{apellidoMessage}}</p>

                  <label for="nacionalidad">Nacionalidad</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nacionalidad"
                    v-model="pasajeroToEdit.nacionalidad"
                    required
                  />
                  <p v-if="nacionalidadAlert" class="color-red">{{nacionalidadMessage}}</p>

                  <label for="domicilio">Domicilio</label>
                  <input
                    type="text"
                    class="form-control"
                    id="domicilio"
                    v-model="pasajeroToEdit.domicilio"
                    required
                  />
                  <p v-if="domicilioAlert" class="color-red">{{domicilioMessage}}</p>

                  <label for="mail">Mail</label>
                  <input type="text" class="form-control" id="mail" v-model="pasajeroToEdit.mail" required />
                  <p v-if="mailAlert" class="color-red">{{mailMessage}}</p>

                  

                  <label for="telefono">Telefono</label>
                  <input type="text" class="form-control" id="telefono" v-model="pasajeroToEdit.telefono" required />
                  <p v-if="telefonoAlert" class="color-red">{{telefonoMessage}}</p>

                  <br />
                  
                </div>
              </div>
            </form>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="options text-center">
            <button
                    @click="modificarPasajero(pasajeroToEdit)"
                    type="button"
                    class="btn btn-lg btn-block btn-primary options"
                  >Guardar Cambios</button>
            <button
              @click="volverReserva"
              type="button"
              class="btn btn-lg btn-block btn-primary options text-center"
            >Volver</button>
          </div>
        </div>
        <br />
      </div>
    </div>
    <div v-if="showAgregarPasajero">
      <div class="text-center">
        <h4 class="mb-3">Ingrese sus datos personales</h4>
        <div class="row options">
          <div class="options text-center">
            <form class="needs-validation" novalidate>
              <div class="row options">
                <div>
                  <label for="dni">DNI</label>
                  <input type="text" class="form-control" id="dni" v-model="dni" required />
                  <p v-if="dniAlert" class="color-red">{{dniMessage}}</p>

                  <label for="nombre">Nombre</label>
                  <input type="text" class="form-control" id="nombre" v-model="nombre" required />
                  <p v-if="nombreAlert" class="color-red">{{nombreMessage}}</p>

                  <label for="apellido">Apellido</label>
                  <input type="text" class="form-control" id="apellido" v-model="apellido" required />
                  <p v-if="apellidoAlert" class="color-red">{{apellidoMessage}}</p>

                  <label for="nacionalidad">Nacionalidad</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nacionalidad"
                    v-model="nacionalidad"
                    required
                  />
                  <p v-if="nacionalidadAlert" class="color-red">{{nacionalidadMessage}}</p>

                  <label for="domicilio">Domicilio</label>
                  <input
                    type="text"
                    class="form-control"
                    id="domicilio"
                    v-model="domicilio"
                    required
                  />
                  <p v-if="domicilioAlert" class="color-red">{{domicilioMessage}}</p>

                  <label for="mail">Mail</label>
                  <input type="text" class="form-control" id="mail" v-model="mail" required />
                  <p v-if="mailAlert" class="color-red">{{mailMessage}}</p>

                  

                  <label for="telefono">Telefono</label>
                  <input type="text" class="form-control" id="telefono" v-model="telefono" required />
                  <p v-if="telefonoAlert" class="color-red">{{telefonoMessage}}</p>

                  <br />
                  
                </div>
              </div>
            </form>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="options text-center">
            <button
                    @click="agregarPasajero()"
                    type="button"
                    class="btn btn-lg btn-block btn-primary options"
                  >Guardar Cambios</button>
            <button
              @click="volverReserva"
              type="button"
              class="btn btn-lg btn-block btn-primary options text-center"
            >Volver Al Menú</button>
          </div>
        </div>
        <br />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "VistaReserva",
  props: {
    
    reservaSeleccionada: null,
    vuelo_id: null,
    actividad_id: null,
    alojamiento_id: null,
    pasajerosSeleccionados: null,
    pasajeroToEdit: null,

    dni : null,
    nombre : null,
    apellido : null,
    mail : null,
    nacionalidad : null,
    telefono : null,
    domicilio : null,
    

    

    showDetalle: {
      type: Boolean,
      default: true
    },

    showEditarPasajero: {
      type: Boolean,
      default: false
    },
    
    showAgregarPasajero: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    volver() {
      this.$parent.cargaMenu();
    },
    volverMenu(){
      this.$parent.cargaHome();
    },
    volverReserva(){
       this.showEditarPasajero = false;
       this.showAgregarPasajero = false;
       this.showDetalle = true;
    },
    
    eliminarVuelo() {
      if (confirm("Desea eliminar este vuelo?"))
        this.$axios
          .put(
            "https://localhost:57935/api/reserva/" +
              this.reservaSeleccionada.id,
            {
              id: this.reservaSeleccionada.id,
              nroReserva: this.reservaSeleccionada.nroReserva,
              usuario: this.reservaSeleccionada.usuario.id,
              destino: this.reservaSeleccionada.destino.id,
              alojamiento: this.alojamiento_id,
              actividad: this.actividad_id,
              vuelo: null,
              esUnPaquete: this.reservaSeleccionada.esUnPaquete,
              paquete: this.reservaSeleccionada.paquete,
              importe: this.reservaSeleccionada.importe,
              pasajeros: this.reservaSeleccionada.pasajeros,
              reservaFinalizada: this.reservaSeleccionada.reservaFinalizada
            }
          )
          .then(() => {
            this.actualizar();
          })
          .catch(() => {
            alert("El Vuelo no fue eliminado");
          });
    },
    eliminarActividad() {
      if (confirm("Deses eliminar actividad?"))
      if(this.reservaSeleccionada.paquete==null){
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: this.alojamiento_id,
            actividad: null,
            vuelo: this.vuelo_id,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: null,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: false
          }
        )
        .then(() => {
          this.actualizar();
        })
        .catch(() => {
          alert("El Alojamiento no fue eliminado");
        });

      }else{
        
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: this.actividad_id,
            actividad: null,
            vuelo: null,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: this.reservaSeleccionada.paquete.id,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: true
          }
        )
        .then(() => {
          this.actualizar();
        })
        .catch(() => {
          alert("El Alojamiento no fue eliminado");
        });
      }
      if (confirm("Desea eliminar esta actividad?"))
        this.$axios
          .put(
            "https://localhost:57935/api/reserva/" +
              this.reservaSeleccionada.id,
            {
              id: this.reservaSeleccionada.id,
              nroReserva: this.reservaSeleccionada.nroReserva,
              usuario: this.reservaSeleccionada.usuario.id,
              destino: this.reservaSeleccionada.destino.id,
              alojamiento: this.alojamiento_id,
              actividad: null,
              vuelo: this.vuelo_id,
              esUnPaquete: this.reservaSeleccionada.esUnPaquete,
              paquete: this.reservaSeleccionada.paquete,
              importe: this.reservaSeleccionada.importe,
              pasajeros: this.reservaSeleccionada.pasajeros,
              reservaFinalizada: false
            }
          )
          .then(() => {
            this.actualizar();
          })
          .catch(() => {
            alert("La Actividad no fue eliminado");
          });
    },
    eliminarAlojamiento() {
       if (confirm("Deses eliminar alojamiento?"))
      if(this.reservaSeleccionada.paquete==null){
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: null,
            actividad: this.actividad_id,
            vuelo: this.vuelo_id,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: null,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: false
          }
        )
        .then(() => {
          this.actualizar();
        })
        .catch(() => {
          alert("El Alojamiento no fue eliminado");
        });

      }else{
        
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: null,
            actividad: this.actividad_id,
            vuelo: null,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: this.reservaSeleccionada.paquete.id,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: true
          }
        )
        .then(() => {
          this.actualizar();
        })
        .catch(() => {
          alert("El Alojamiento no fue eliminado");
        });
      }
     
    },
    eliminarPasajero(pasajero) {
      if (confirm("Desea eliminar esta pasajero?"))
        this.$axios
          .delete("https://localhost:57935/api/pasajero/" + pasajero.id)
          .then(() => {
            this.actualizar();
          })
          .catch(() => {
            alert("El Usuario no fue eliminado");
          });
    },

    vistaModificarPasajero(pasajero) {
      this.pasajeroToEdit = pasajero;
      this.showList = false;
      this.showDetalle = false;
      this.showEditarPasajero = true;
    },
     vistaAgregarPasajero() {
      
      this.showList = false;
      this.showDetalle = false;
      this.showAgregarPasajero = true;
    },

    agregarPasajero(){
      if (confirm("Desea Guardar Cambios?"))
        this.$axios
          .post(
            "https://localhost:57935/api/pasajero" ,
              
            {
              
              nombre: this.nombre,
              apellido: this.apellido,
              dni: this.dni,
              domicilio: this.domicilio,
              mail: this.mail,
              nacionalidad: this.nacionalidad,
              reserva: this.reservaSeleccionada.id,
              telefono: this.telefono,
              
            }
          )
          .then(() => {
            this.actualizar();
            this.showDetalle=true;
            this.showAgregarPasajero=false;
          })
          .catch(() => {
            alert("El Pasajero no fue Agregado");
          });

    },

    
    modificarPasajero(){

      if (confirm("Desea Guardar Cambios?"))
        this.$axios
          .put(
            "https://localhost:57935/api/pasajero/" +
              this.pasajeroToEdit.id,
            {
              id: this.pasajeroToEdit.id,
              nombre: this.pasajeroToEdit.nombre,
              apellido: this.pasajeroToEdit.apellido,
              dni: this.pasajeroToEdit.dni,
              domicilio: this.pasajeroToEdit.domicilio,
              mail: this.pasajeroToEdit.mail,
              nacionalidad: this.pasajeroToEdit.nacionalidad,
              reserva: this.pasajeroToEdit.reserva,
              telefono: this.pasajeroToEdit.telefono,
              
            }
          )
          .then(() => {
            this.actualizar();
            this.showDetalle=true;
            this.showEditarPasajero=false;
          })
          .catch(() => {
            alert("El Pasajero no fue modificado");
          });

    },
    actualizar() {
      this.$axios
        .get(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id
        )
        .then(response => {
          this.reservaSeleccionada = response.data;
          if (this.reservaSeleccionada.vuelo != null) {
            this.vuelo_id = this.reservaSeleccionada.vuelo.id;
          } else {
            this.vuelo_id = null;
          }

          if (this.reservaSeleccionada.actividad != null) {
            this.actividad_id = this.reservaSeleccionada.actividad.id;
          } else {
            this.actividad_id = null;
          }

          if (this.reservaSeleccionada.alojamiento != null) {
            this.alojamiento_id = this.reservaSeleccionada.alojamiento.id;
          } else {
            this.alojamiento_id = null;
          }
          this.pasajerosSeleccionados = this.reservaSeleccionada.pasajeros;
          this.$parent.reserva = this.reservaSeleccionada;
        });
    },
    eliminarReserva(){
       if (confirm("Desea eliminar reserva"))
       this.$axios.delete('https://localhost:57935/api/reserva/'+this.reservaSeleccionada.id)
      .then(() => {
        this.$parent.reserva = null;
        this.$parent.showReservation = false;
        this.$parent.cargaHome();
        
      }).catch(() => {alert("La Reserva no fue eliminada");});
    },
    confirmarReserva() {
      if (confirm("Desea confirmar reserva?"))
      if(this.reservaSeleccionada.paquete==null){
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: this.alojamiento_id,
            actividad: this.actividad_id,
            vuelo: this.vuelo_id,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: null,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: true
          }
        )
        .then(() => {
          
           this.$parent.reserva = null;
           this.$parent.showReservation = false;
          this.$parent.cargaHome();
          
        })
        .catch(() => {
          alert("La Reserva no fue confirmada");
        });

      }else{
        
        this.$axios
        .put(
          "https://localhost:57935/api/reserva/" + this.reservaSeleccionada.id,
          {
            id: this.reservaSeleccionada.id,
            nroReserva: this.reservaSeleccionada.nroReserva,
            usuario: this.reservaSeleccionada.usuario.id,
            destino: this.reservaSeleccionada.destino.id,
            alojamiento: null,
            actividad: null,
            vuelo: null,
            esUnPaquete: this.reservaSeleccionada.esUnPaquete,
            paquete: this.reservaSeleccionada.paquete.id,
            importe: this.reservaSeleccionada.importe,
            pasajeros: this.reservaSeleccionada.pasajeros,
            reservaFinalizada: true
          }
        )
        .then(() => {
          
           this.$parent.reserva = null;
          this.$parent.showReservation = false;
          this.$parent.cargaHome();
        })
        .catch(() => {
          alert("La Reserva no fue confirmada");
        });
      }
      
    },
    init() {
      this.reservaSeleccionada = this.$parent.reserva;
      if (this.reservaSeleccionada.vuelo != null) {
        this.vuelo_id = this.reservaSeleccionada.vuelo.id;
      } else {
        this.vuelo_id = null;
      }

      if (this.reservaSeleccionada.actividad != null) {
        this.actividad_id = this.reservaSeleccionada.actividad.id;
      } else {
        this.actividad_id = null;
      }

      if (this.reservaSeleccionada.alojamiento != null) {
        this.alojamiento_id = this.reservaSeleccionada.alojamiento.id;
      } else {
        this.alojamiento_id = null;
      }
      
      this.pasajerosSeleccionados = this.reservaSeleccionada.pasajeros;
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