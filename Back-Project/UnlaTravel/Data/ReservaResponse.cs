﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UnlaTravel.Data
{
    public class ReservaResponse
    {
        public int Id { get; set; }
        public string NroReserva { get; set; }
        public UsuarioResponse Usuario { get; set; }
        public DestinoResponse Destino { get; set; }
        public AlojamientoResponse Alojamiento { get; set; }
        public ActividadResponse Actividad { get; set; }
        public VueloResponse Vuelo { get; set; }
        public bool EsUnPaquete { get; set; }
        public PaqueteResponse Paquete { get; set; }
        public decimal Importe { get; set; }
    }
}