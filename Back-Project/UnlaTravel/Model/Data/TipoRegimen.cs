using System;
namespace UnlaTravel.Model.Data
{
	public class TipoRegimen
	{
		[Key]
		public int Id { set; get; }
		public string Descripcion { set; get; }

		public TipoRegimen()
		{
		}
	}
}