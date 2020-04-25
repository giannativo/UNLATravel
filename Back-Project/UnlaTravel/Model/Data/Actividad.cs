using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Actividad
	{	
		[Key]
		public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string Lugar { get; set; }
        public string Valoracion { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
        public Destino Destino { get; set; }
    }
}