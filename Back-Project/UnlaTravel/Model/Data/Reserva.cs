using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Reserva
	{
		[Key]
		public int Id { get; set; }
        public string NroReserva { get; set; }
        public int Usuario { get; set; }
        public int Destino { get; set; }
        public int Alojamiento { get; set; }
        public int Actividad { get; set; }
        public int Vuelo { get; set; }
        public Boolean EsUnPaquete { get; set; }
        public int Paquete { get; set; }
        public double Importe { get; set; }
	}
}