using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using UnlaTravel.Contexts;
using UnlaTravel.Model.Data;

namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class TipoAlojamientoController : Controller
    {
        private readonly AppDbContext context;

        public TipoAlojamientoController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<TipoAlojamiento> Get()
        {
            return context.TipoAlojamiento.ToList();
        }

        [HttpGet("{id}")]
        public TipoAlojamiento Get(int id)
        {
            var tipoAlojamiento = context.TipoAlojamiento.FirstOrDefault(u => u.Id == id);
            return tipoAlojamiento;
        }
    }
}
