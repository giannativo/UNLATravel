using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Destino
	{
		[Key]
		public int Id { get; set; }
        public string Pais { get; set; }
        public string Lugar { get; set; }
    }
}