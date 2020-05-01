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
    public class DestinoController : Controller
    {
        private readonly AppDbContext context;

        public DestinoController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Destino> Get()
        {
            return context.Destino.ToList();
        }

        [HttpGet("{id}")]
        public Destino Get(int id)
        {
            var destino = context.Destino.FirstOrDefault(u => u.Id == id);
            return destino;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Destino destino)
        {
            try
            {
                context.Destino.Add(destino);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Destino destino)
        {
            if (destino.Id == id)
            {
                context.Entry(destino).State = EntityState.Modified;
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
            var destino = context.Destino.FirstOrDefault(u => u.Id == id);
            if (destino != null)
            {
                context.Destino.Remove(destino);
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
