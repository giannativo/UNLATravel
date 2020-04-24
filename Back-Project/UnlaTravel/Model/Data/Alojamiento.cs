using System;

namespace UnlaTravel.Model.Data{
	public class Alojamiento{
		
		public int Id { set; get; }
		public int CantidadDeEstrellas { set; get; }
		public string TipoDeHabitacion { set; get; }
		public string TipoDeServicio { set; get; }
		public Boolean AccesoADiscapacitados { set; get; }
		public Destino Destino { set; get; }
		public TipoRegimen TipoRejimen { set; get; }
		public TipoAlojamiento TipoAlojamiento { set; get; }


		public Alojamiento(){
		}
	}
}
