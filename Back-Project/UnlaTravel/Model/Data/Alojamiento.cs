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
        public Destino Destino { get; set; }
        public TipoRegimen TipoRegimen { get; set; }
        public TipoAlojamiento TipoAlojamiento { get; set; }
	}
}
