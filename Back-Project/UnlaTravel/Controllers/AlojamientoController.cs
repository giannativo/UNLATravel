using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using UnlaTravel.Contexts;


namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class AlojamientoController : Controller
    {
        private readonly AppDbContext context;

        public AlojamientoController(AppDbContext context)
        {
            this.context = context;
        }


    }
}
