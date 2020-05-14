using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using UnlaTravel.Data;
using UnlaTravel.Models;

namespace UnlaTravel.Controllers
{
    [Route("api/[controller]")]
    public class AuthController : Controller
    {
        private readonly UnlaTravelContext context;
        private readonly IMapper _mapper;
        private readonly IConfiguration _configuration;


        public AuthController(UnlaTravelContext context, IMapper mapper, IConfiguration configuration)
        {
            this.context = context;
            this._mapper = mapper;
            this._configuration = configuration;
        }
        [HttpPost]
        [Route("[action]")]
        public IActionResult Login([FromBody]UsuarioDto usuario)
        {
            // Tu código para validar que el usuario ingresado es válido
            UsuarioResponse user = new UsuarioResponse();
            var resultDb = context.Usuario.FirstOrDefault(u => u.Mail == usuario.Mail);
            user = _mapper.Map<Usuario, UsuarioResponse>(resultDb);

            // Asumamos que tenemos un usuario válido
          
            // Leemos el secret_key desde nuestro appseting
            var secretKey = _configuration.GetValue<string>("SecretKey");
            var key = Encoding.ASCII.GetBytes(secretKey);

            // Creamos los claims (pertenencias, características) del usuario
            

           /* var claims = new[]
            {

            new System.Security.Claims.ClaimsIdentity("UserData", JsonConvert.SerializeObject(user))
             };*/

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new System.Security.Claims.ClaimsIdentity(),
                // Nuestro token va a durar un día
                Expires = DateTime.UtcNow.AddDays(1),
                // Credenciales para generar el token usando nuestro secretykey y el algoritmo hash 256
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var tokenHandler = new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler();
            var createdToken = tokenHandler.CreateToken(tokenDescriptor);

            return Content(tokenHandler.WriteToken(createdToken));
        }

      
      

    }
}
