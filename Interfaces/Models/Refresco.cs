using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasesyObjetos.Models
{
    internal class Refresco : Bebida,IBebidaGasificada
    {
        public Refresco(string Nombre, int Cantidad) : base(Nombre, Cantidad)
        {
        }

        public int Gas { get; set; }

        public void BotellasRecomendadas()
        {
            Console.WriteLine("Las recomendadas son 2 botellas por día");
        }
    }
}
