using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UnlaTravel.Data;
using UnlaTravel.Models;

namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class ReservaController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public ReservaController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<ReservaResponse> Get()
        {
            IEnumerable<ReservaResponse> response = new List<ReservaResponse>();
            var resultDb = context.Reserva.Include(x => x.DestinoNavigation)
                .Include(x => x.UsuarioNavigation)
                .Include(x => x.VueloNavigation)
                .Include(x => x.VueloNavigation.OrigenNavigation)
                .Include(x => x.VueloNavigation.DestinoNavigation)
                .Include(x => x.ActividadNavigation)
                .Include(x => x.ActividadNavigation.DestinoNavigation)
                .Include(x => x.AlojamientoNavigation)
                .Include(x => x.AlojamientoNavigation.DestinoNavigation)
                .Include(x => x.AlojamientoNavigation.TipoRegimenNavigation)
                .Include(x => x.AlojamientoNavigation.TipoAlojamientoNavigation)
                .Include(x => x.PaqueteNavigation)
                .Include(x => x.PaqueteNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation.OrigenNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.ActividadNavigation)
                .Include(x => x.PaqueteNavigation.ActividadNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.TipoRegimenNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.TipoAlojamientoNavigation)
                .ToList().OrderBy(x => x.Id);
            response = _mapper.Map<IEnumerable<Reserva>, IEnumerable<ReservaResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public ReservaResponse Get(int id)
        {
            ReservaResponse response = new ReservaResponse();
            var resultDb = context.Reserva.Include(x => x.DestinoNavigation)
                .Include(x => x.UsuarioNavigation)
                .Include(x => x.VueloNavigation)
                .Include(x => x.VueloNavigation.OrigenNavigation)
                .Include(x => x.VueloNavigation.DestinoNavigation)
                .Include(x => x.ActividadNavigation)
                .Include(x => x.ActividadNavigation.DestinoNavigation)
                .Include(x => x.AlojamientoNavigation)
                .Include(x => x.AlojamientoNavigation.DestinoNavigation)
                .Include(x => x.AlojamientoNavigation.TipoRegimenNavigation)
                .Include(x => x.AlojamientoNavigation.TipoAlojamientoNavigation)
                .Include(x => x.PaqueteNavigation)
                .Include(x => x.PaqueteNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation.OrigenNavigation)
                .Include(x => x.PaqueteNavigation.VueloNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.ActividadNavigation)
                .Include(x => x.PaqueteNavigation.ActividadNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.DestinoNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.TipoRegimenNavigation)
                .Include(x => x.PaqueteNavigation.AlojamientoNavigation.TipoAlojamientoNavigation)
                .FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<Reserva, ReservaResponse>(resultDb);
            return response;
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
                return BadRequest(e.Message);
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Reserva reserva)
        {
            try
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
            catch (Exception e)
            {

                return BadRequest(e.Message);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            try
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
            catch (Exception e)
            {

                return BadRequest(e.Message);
            }
        }
    }
}
