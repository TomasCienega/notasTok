using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasesyObjetos.Models
{
    internal class Jugo : Bebida, IBebidaGasificada
    {
        public Jugo(string Nombre, int Cantidad) : base(Nombre, Cantidad)
        {
        }

        public int Gas { get; set; }

        public void BotellasRecomendadas()
        {
            Console.WriteLine("Lo recomendado son 5 vasos por día");
        }
    }
}
