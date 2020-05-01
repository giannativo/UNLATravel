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
    public class ReservaController : Controller
    {
        private readonly AppDbContext context;

        public ReservaController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Reserva> Get()
        {
            return context.Reserva.ToList();
        }

        [HttpGet("{id}")]
        public Reserva Get(int id)
        {
            var reserva = context.Reserva.FirstOrDefault(u => u.Id == id);
            return reserva;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Reserva reserva)
        {
            try
            {
                context.Reserva.Add(reserva);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Reserva reserva)
        {
            if (reserva.Id == id)
            {
                context.Entry(reserva).State = EntityState.Modified;
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
            var reserva = context.Reserva.FirstOrDefault(u => u.Id == id);
            if (reserva != null)
            {
                context.Reserva.Remove(reserva);
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
