using System;
namespace UnlaTravel.Model.Data
{
	public class Paquete
	{
		public int Id { set; get; }
		public Destino Destino { get; set; }
		public DateTime fechaIda { set; get; }
		public DateTime fechaVuelta { set; get; }
		public Alojamiento Hotel { set; get; }
		public Vuelo Vuelo { set; get; }
		public Actividad Actividad { set; get; }
		public int CantidadDePersonas { set; get; }
		public int Habitaciones { set; get;}
		public Boolean AccesoADiscapacitados { set; get; }

		public Paquete()
		{
		}
	}
}