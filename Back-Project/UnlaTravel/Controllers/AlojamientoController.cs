using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UnlaTravel.Contexts;
using UnlaTravel.Model.Data;

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

        [HttpGet]
        public IEnumerable<Alojamiento> Get()
        {
            return context.Alojamiento.ToList();
        }

        [HttpGet("{id}")]
        public Alojamiento Get(int id)
        {
            var alojamiento = context.Alojamiento.FirstOrDefault(u => u.Id == id);
            return alojamiento;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Alojamiento alojamiento)
        {
            try
            {
                context.Alojamiento.Add(alojamiento);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Alojamiento alojamiento)
        {
            if (alojamiento.Id == id)
            {
                context.Entry(alojamiento).State = EntityState.Modified;
                context.SaveChanges();
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var alojamiento = context.Alojamiento.FirstOrDefault(u => u.Id == id);
            if (alojamiento != null)
            {
                context.Alojamiento.Remove(alojamiento);
                context.SaveChanges();
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }
    }
}
