using System;

public class Vuelo
{	
	[Key]
	public int Id { set; get; }
	public DateTime Fecha_ida { set;get }
	public DateTime Fecha_vuelta { set; get; }
	public Destino Destino { set; get; }
	public Boolean Ida_y_vuelta { set; get; }
	public int ValoracionDeAereolinea { set; get; }
	public int Clase { set; get; }
	public Boolean ConEscala { set; get; }
	public Boolean AccesoADiscapacitados { set; get; }

	public Vuelo()
	{
	}
}
