using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Actividad
	{	
		[Key]
		public int Id { get; set; }
        public DateTime FechaDesde { get; set; }
        public DateTime FechaHasta { get; set; }  
        public string NombreActividad { get; set; }
        public string Descripcion { get; set; }
        public string FranjaHoraria { get; set; }
        public string Valoracion { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
        public int Destino { get; set; }
    }
}