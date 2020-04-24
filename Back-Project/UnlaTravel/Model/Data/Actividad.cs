using System;
namespace UnlaTravel.Model.Data
{
	public class Actividad
	{	
		[Key]
		public int Id { set; get; }
		public DateTime Fecha { set; get; }
		public string lugar { set; get; }
		public string valoracion { set; get; }
		public Boolean AccesoADiscapacitados { set; get; }
		public Destino Destiono { set; get; }

		public Actividad()
		{
		}
	}
}