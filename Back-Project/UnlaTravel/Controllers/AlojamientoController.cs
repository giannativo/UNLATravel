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
    public class AlojamientoController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public AlojamientoController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<AlojamientoResponse> Get()
        {
            IEnumerable<AlojamientoResponse> response = new List<AlojamientoResponse>();
            var resultDb = context.Alojamiento.Include(x => x.DestinoNavigation).Include(x => x.TipoAlojamientoNavigation).Include(x => x.TipoRegimenNavigation).ToList().OrderBy(x => x.Id);
            response = _mapper.Map<IEnumerable<Alojamiento>, IEnumerable<AlojamientoResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public AlojamientoResponse Get(int id)
        {
            AlojamientoResponse response = new AlojamientoResponse();
            var resultDb = context.Alojamiento.Include(x => x.DestinoNavigation).Include(x => x.TipoAlojamientoNavigation).Include(x => x.TipoRegimenNavigation).FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<Alojamiento, AlojamientoResponse>(resultDb);
            return response;

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
