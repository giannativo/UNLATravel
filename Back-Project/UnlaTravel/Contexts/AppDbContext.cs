using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UnlaTravel.Model.Data;

namespace UnlaTravel.Contexts
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Usuario> Usuario { get; set; }
        public DbSet<Actividad> Actividad { get; set; }
        public DbSet<Vuelo> Vuelo { get; set; }
        public DbSet<Alojamiento> Alojamiento { get; set; }
        public DbSet<Paquete> Paquete { get; set; }
        public DbSet<Reserva> Reserva { get; set; }
        public DbSet<TipoAlojamiento> TipoAlojamiento { get; set; }
        public DbSet<TipoRegimen> TipoRegimen { get; set; }
        public DbSet<Destino> Destino { get; set; }

    }
}
