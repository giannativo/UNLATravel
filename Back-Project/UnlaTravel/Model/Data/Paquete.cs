using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Paquete
	{
		[Key]
		public int Id { get; set; }
        public string TipoPaquete { get; set; }
        public Destino Destino { get; set; }
        public DateTime FechaIda { get; set; }
        public DateTime FechaVuelta { get; set; }
        public Alojamiento Hotel { get; set; }
        public Vuelo Vuelo { get; set; }
        public Actividad Actividad { get; set; }
        public int CantidadPersonas { get; set; }
        public int Habitaciones { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
	}
}