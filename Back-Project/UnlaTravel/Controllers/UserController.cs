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
    public class UserController : Controller
    {
        private readonly AppDbContext context;

        public UserController(AppDbContext context)
        {
            this.context = context;
        }

        // GET: api
        [HttpGet]
        public IEnumerable<Usuario> Get()
        {
            return context.Usuario.ToList();
        }

        // GET api/id
        [HttpGet("{id}")]
        public Usuario Get(int id)
        {
            var user = context.Usuario.FirstOrDefault(u => u.Dni == id);
            return user;
        }

        // POST api
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

        // PUT api
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]Usuario user)
        {
            if(user.Dni == id)
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

        // DELETE api
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            var user = context.Usuario.FirstOrDefault(u => u.Dni == id);
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
