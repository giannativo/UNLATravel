﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UnlaTravel.Data
{
    public class VueloResponse
    {
        public int Id { get; set; }
        public DateTime FechaIda { get; set; }
        public DateTime FechaVuelta { get; set; }
        public string NombreAereolinea { get; set; }
        public string Link { get; set; }
        public DestinoResponse Origen { get; set; }
        public DestinoResponse Destino { get; set; }
        public bool IdaVuelta { get; set; }
        public int? ValoracionAereolinea { get; set; }
        public string Clase { get; set; }
        public bool ConEscala { get; set; }
        public bool AccesoDiscapacitados { get; set; }
        public decimal Precio { get; set; }
    }
}
