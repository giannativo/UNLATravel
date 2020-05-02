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
    public class VueloController : Controller
    {
        private readonly AppDbContext context;

        public VueloController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Vuelo> Get()
        {
            return context.Vuelo.ToList();
        }

        [HttpGet("{id}")]
        public Vuelo Get(int id)
        {
            var vuelo = context.Vuelo.FirstOrDefault(u => u.Id == id);
            return vuelo;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Vuelo vuelo)
        {
            try
            {
                context.Vuelo.Add(vuelo);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Vuelo vuelo)
        {
            if (vuelo.Id == id)
            {
                context.Entry(vuelo).State = EntityState.Modified;
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
            var vuelo = context.Vuelo.FirstOrDefault(u => u.Id == id);
            if (vuelo != null)
            {
                context.Vuelo.Remove(vuelo);
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
