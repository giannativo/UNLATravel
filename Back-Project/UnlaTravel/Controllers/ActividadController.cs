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
    public class ActividadController : Controller
    {
        private readonly AppDbContext context;

        public ActividadController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Actividad> Get()
        {
            return context.Actividad.ToList();
        }

        [HttpGet("{id}")]
        public Actividad Get(int id)
        {
            var actividad = context.Actividad.FirstOrDefault(u => u.Id == id);
            return actividad;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Actividad actividad)
        {
            try
            {
                context.Actividad.Add(actividad);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Actividad actividad)
        {
            if (actividad.Id == id)
            {
                context.Entry(actividad).State = EntityState.Modified;
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
            var actividad = context.Actividad.FirstOrDefault(u => u.Id == id);
            if (actividad != null)
            {
                context.Actividad.Remove(actividad);
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
