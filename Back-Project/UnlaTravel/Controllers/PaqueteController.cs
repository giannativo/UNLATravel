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
    public class PaqueteController : Controller
    {
        private readonly AppDbContext context;

        public PaqueteController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Paquete> Get()
        {
            return context.Paquete.ToList();
        }

        [HttpGet("{id}")]
        public Paquete Get(int id)
        {
            var paquete = context.Paquete.FirstOrDefault(u => u.Id == id);
            return paquete;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Paquete paquete)
        {
            try
            {
                context.Paquete.Add(paquete);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Paquete paquete)
        {
            if (paquete.Id == id)
            {
                context.Entry(paquete).State = EntityState.Modified;
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
            var paquete = context.Paquete.FirstOrDefault(u => u.Id == id);
            if (paquete != null)
            {
                context.Paquete.Remove(paquete);
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
