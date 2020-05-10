 using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using UnlaTravel.Data;
using UnlaTravel.Models;

namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class TipoAlojamientoController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public TipoAlojamientoController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<TipoAlojamientoResponse> Get()
        {
            IEnumerable<TipoAlojamientoResponse> response = new List<TipoAlojamientoResponse>();
            var resultDb = context.TipoAlojamiento.ToList().OrderBy(x => x.Id); 
            response = _mapper.Map<IEnumerable<TipoAlojamiento>, IEnumerable<TipoAlojamientoResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public TipoAlojamientoResponse Get(int id)
        {
            TipoAlojamientoResponse response = new TipoAlojamientoResponse();
            var resultDb = context.TipoAlojamiento.FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<TipoAlojamiento, TipoAlojamientoResponse>(resultDb);
            return response;
        }
    }
}
