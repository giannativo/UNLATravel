using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class TipoAlojamiento
	{
		[Key]
		public int Id { get; set; }
        public string Descripcion { get; set; }
    }
}