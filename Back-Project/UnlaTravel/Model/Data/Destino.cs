using System;
namespace UnlaTravel.Model.Data
{
	public class Destino
	{
		[Key]
		public int Id { set; get; }
		public string Pais { set; get; }
		public string Lugar { set; get; }
		public Destino()
		{
		}
	}
}