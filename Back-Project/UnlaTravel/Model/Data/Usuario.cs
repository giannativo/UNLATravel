using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UnlaTravel.Model.Data
{
    public class Usuario
    {
        [Key]
        public int Id { get; set; }
        public int Dni { get; set; } 
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Nacionalidad { get; set; }
        public string Domicilio { get; set; }
        public string Mail { get; set; }
        public string Telefono { get; set; }
        public Boolean Rol {get; set;}
        public string Contraseña { get; set; }
    }
}
