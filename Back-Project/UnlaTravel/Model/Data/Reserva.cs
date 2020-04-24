using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Reserva
	{
		[Key]
		public int Id { get; set; }
        public string NroReserva { get; set; }
        public Usuario Usuario { get; set; }
        public Destino Destino { get; set; }
        public Alojamiento Alojamiento { get; set; }
        public Actividad Actividad { get; set; }
        public Vuelo Vuelo { get; set; }
        public Boolean EsUnPaquete { get; set; }
        public Paquete Paquete { get; set; }
        public double Importe { get; set; }
	}
}