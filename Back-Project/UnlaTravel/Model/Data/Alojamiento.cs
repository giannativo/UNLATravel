using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data{
	public class Alojamiento
    {
		[Key]
		public int Id { get; set; }
        public int CantidadEstrellas { get; set; }
        public string TipoHabitacion { get; set; }
        public string TipoServicio { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
        public int Destino { get; set; }
        public int TipoRegimen { get; set; }
        public int TipoAlojamiento { get; set; }
        public string NombreAlojamiento { get; set; }
        public string Link { get; set; }
    }
}
