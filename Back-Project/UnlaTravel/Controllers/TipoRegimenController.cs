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
    public class TipoRegimenController : Controller
    {
        private readonly AppDbContext context;

        public TipoRegimenController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<TipoRegimen> Get()
        {
            return context.TipoRegimen.ToList();
        }

        [HttpGet("{id}")]
        public TipoRegimen Get(int id)
        {
            var tipoRegimen = context.TipoRegimen.FirstOrDefault(u => u.Id == id);
            return tipoRegimen;
        }
    }
}
