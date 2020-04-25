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
        public Destino Origen { get; set; }
        public Destino Destino { get; set; }
        public Boolean IdaVuelta { get; set; }
        public int ValoracionAereolinea { get; set; }
        public int Clase { get; set; }
        public Boolean ConEscala { get; set; }
        public Boolean AccesoDiscapacitados { get; set; }
    }
}