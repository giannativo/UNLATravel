using System;
namespace UnlaTravel.Model.Data
{
	public class TipoAlojamiento
	{
		[Key]
		public int Id { set; get; }
		public string Descripcion { set; get; }
		public TipoAlojamiento()
		{
		}
	}
}