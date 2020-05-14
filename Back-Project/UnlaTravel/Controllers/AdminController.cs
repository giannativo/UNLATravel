using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using UnlaTravel.Data;
using UnlaTravel.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class AdminController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public AdminController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<UsuarioResponse> GetAdminList()
        {
            IEnumerable<UsuarioResponse> response = new List<UsuarioResponse>();
            var resultDb = context.Usuario.ToList().OrderBy(x => x.Id).Where(x => x.IsAdmin);
            response = _mapper.Map<IEnumerable<Usuario>, IEnumerable<UsuarioResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public UsuarioResponse GetAdmin(int id)
        {
            UsuarioResponse response = new UsuarioResponse();
            var resultDb = context.Usuario.Where(x => x.IsAdmin).FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<Usuario, UsuarioResponse>(resultDb);
            return response;
        }
    }
}
