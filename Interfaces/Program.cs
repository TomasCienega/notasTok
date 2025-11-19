// See https://aka.ms/new-console-template for more information
using ClasesyObjetos.Models;


//Una clase sirve para crear un objeto de la vida real, la clase define atributos y acciones.

Bebida bebida = new Bebida("Sangría",1000);
bebida.Beber(800);

if(bebida.Cantidad < 300)
{
    Console.WriteLine("Bebe más despacio o comprate otra ya solo quedan " + bebida.Cantidad + "ml");
}
else
{
    Console.WriteLine("Aún queda bastante bebida disfruta tus " + bebida.Cantidad + "ml");
}

Refresco sangria = new Refresco("Sangría", 700);
sangria.Beber(20);
Console.WriteLine("La bebida más deliciosa, te quedan " + sangria.Cantidad + "ml");

//Clase 4 INTERFACES

var bebidaGasificada = new Jugo("Uva", 190);
MostrarRecomendacion(bebidaGasificada);

var bebidaGasificada2 = new Refresco("Sangría", 500);
MostrarRecomendacion(bebidaGasificada2);

static void MostrarRecomendacion(IBebidaGasificada bebida)
{
    bebida.BotellasRecomendadas();
}



