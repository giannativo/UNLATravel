using System;
using System.Collections.Generic;

namespace UnlaTravel.Models
{
    public partial class Vuelo
    {
        public Vuelo()
        {
            Paquete = new HashSet<Paquete>();
            Reserva = new HashSet<Reserva>();
        }

        public int Id { get; set; }
        public DateTime FechaIda { get; set; }
        public DateTime FechaVuelta { get; set; }
        public string NombreAereolinea { get; set; }
        public int Origen { get; set; }
        public int Destino { get; set; }
        public bool IdaVuelta { get; set; }
        public int? ValoracionAereolinea { get; set; }
        public string Clase { get; set; }
        public bool ConEscala { get; set; }
        public bool AccesoDiscapacitados { get; set; }

        public Destino DestinoNavigation { get; set; }
        public Destino OrigenNavigation { get; set; }
        public ICollection<Paquete> Paquete { get; set; }
        public ICollection<Reserva> Reserva { get; set; }
    }
}
