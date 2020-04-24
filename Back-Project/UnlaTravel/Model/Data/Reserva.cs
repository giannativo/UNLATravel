using System;


namespace UnlaTravel.Model.Data
{
	public class Reserva
	{
		[Key]
		public int Id { set; get; }
		public string NroReserva { set; get; }
		public Usuario Usuario { set; get; }
		public Destino Destino { set; get; }
		public Alojamiento Alojamiento { set; get; }
		public Actividad Actividad { set; get;  }
		public Vuelo Vuelo { set; get; }
		public Boolean EsUnPaquete { set; get; }
		public Paquete Paquete { set; get; }
	}
}