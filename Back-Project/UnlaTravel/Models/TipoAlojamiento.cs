using System;
using System.Collections.Generic;

namespace UnlaTravel.Models
{
    public partial class TipoAlojamiento
    {
        public TipoAlojamiento()
        {
            Alojamiento = new HashSet<Alojamiento>();
        }

        public int Id { get; set; }
        public string Descripcion { get; set; }

        public ICollection<Alojamiento> Alojamiento { get; set; }
    }
}
