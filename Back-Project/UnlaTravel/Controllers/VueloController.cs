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
    public class VueloController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public VueloController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<VueloResponse> Get()
        {
            IEnumerable<VueloResponse> response = new List<VueloResponse>();
            var resultDb = context.Vuelo.Include(x=>x.DestinoNavigation).Include(x=>x.OrigenNavigation).ToList().OrderBy(x=>x.Id);
            response = _mapper.Map<IEnumerable<Vuelo>,IEnumerable<VueloResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public VueloResponse Get(int id)
        {
            VueloResponse response = new VueloResponse();
            var resultDb = context.Vuelo.Include(x => x.DestinoNavigation).Include(x => x.OrigenNavigation).FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<Vuelo, VueloResponse>(resultDb);
            return response;
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
