using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// El namespace es donde pertenece para poder hacer uso del "using"
namespace ClasesyObjetos.Models
{
    internal class Bebida
    {
        public string Nombre { get; set; }
        public int Cantidad { get; set; }

        public Bebida() { }
        public Bebida(string Nombre, int Cantidad)
        {
            this.Nombre = Nombre;
            this.Cantidad = Cantidad;
        }
        public void Beber(int CantidadBebida)
        {
            this.Cantidad -= CantidadBebida;
        }
    }
}
