using System;
using System.ComponentModel.DataAnnotations;

namespace UnlaTravel.Model.Data
{
	public class Vuelo
	{
		[Key]
		public int Id { get; set; }
        public DateTime FechaIda { get; set; }
        public DateTime FechaVuelta { get; set; }
        public int Origen { get; set; }
        public int Destino { get; set; }
        public Boolean IdaVuelta { get; set; }
        public int ValoracionAereolinea { get; set; }
        public int Clase { get; set; }
        public Boolean ConEscala { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
    }
}