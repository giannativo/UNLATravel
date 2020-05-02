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
    public class UsuarioController : Controller
    {
        private readonly AppDbContext context;

        public UsuarioController(AppDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<Usuario> Get()
        {
            return context.Usuario.ToList();
        }

        [HttpGet("{id}")]
        public Usuario Get(int id)
        {
            var user = context.Usuario.FirstOrDefault(u => u.Id == id);
            return user;
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
