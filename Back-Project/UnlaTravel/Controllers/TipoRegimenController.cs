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
    public class TipoRegimenController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;

        public TipoRegimenController(UnlaTravelContext context, IMapper mapper)
        {
            this.context = context;
            this._mapper = mapper;
        }

        [HttpGet]
        public IEnumerable<TipoRegimenResponse> Get()
        {
            IEnumerable<TipoRegimenResponse> response = new List<TipoRegimenResponse>();
            var resultDb = context.TipoRegimen.ToList().OrderBy(x => x.Id); 
            response = _mapper.Map<IEnumerable<TipoRegimen>, IEnumerable<TipoRegimenResponse>>(resultDb);
            return response;
        }

        [HttpGet("{id}")]
        public TipoRegimenResponse Get(int id)
        {
            TipoRegimenResponse response = new TipoRegimenResponse();
            var resultDb = context.TipoRegimen.FirstOrDefault(u => u.Id == id);
            response = _mapper.Map<TipoRegimen, TipoRegimenResponse>(resultDb);
            return response;
        }
    }
}
