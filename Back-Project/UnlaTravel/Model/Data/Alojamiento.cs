using System;

public class Alojamiento
{	
	public int Id { set; get; }
	public string TipoDeAlojamiento { set; get; }
	public int CantidadDeEstrellas { set; get; }
	public string TipoDeRejimen { set; get; }
	public string TipoDeHabitacion { set; get; }
	public Boolean AccesoADiscapacitados { set; get; }
	public Destino Destino { set; get; }

	public Alojamiento()
	{
	}
}
