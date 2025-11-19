using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasesyObjetos.Models
{
    internal interface IBebidaGasificada
    {
        public int Gas {  get; set; }
        public void BotellasRecomendadas();
    }
}
