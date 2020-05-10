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
    public class UsuarioController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public UsuarioController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<UsuarioResponse> Get()
        {
            IEnumerable<UsuarioResponse> response = new List<UsuarioResponse>();
            var resultDb = context.Usuario.ToList().OrderBy(x => x.Id); 
            response = _mapper.Map<IEnumerable<Usuario>, IEnumerable<UsuarioResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public UsuarioResponse Get(int id)
        {
            UsuarioResponse response = new UsuarioResponse();
            var resultDb = context.Usuario.FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<Usuario, UsuarioResponse>(resultDb);
            return response;
        }

        [HttpPost]
        public ActionResult Post([FromBody]Usuario user)
        {
            try
            {
                context.Usuario.Add(user);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest();
            }
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Usuario user)
        {
            if(user.Id == id)
            {
                context.Entry(user).State = EntityState.Modified;
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
            var user = context.Usuario.FirstOrDefault(u => u.Id == id);
            if(user != null)
            {
                context.Usuario.Remove(user);
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
