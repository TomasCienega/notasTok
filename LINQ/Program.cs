// See https://aka.ms/new-console-template for more information
using ClasesyObjetos.Models;
//Se agrego en la clase 5
using Microsoft.Data.SqlClient;
using System.Linq;

//Se agregaron en la clase número 7
using System.Text.Json;
using System.Text.Json.Serialization;


//Una clase sirve para crear un objeto de la vida real, la clase define atributos y acciones.

//Bebida bebida = new Bebida("Sangría",1000);
//bebida.Beber(800);

//if(bebida.Cantidad < 300)
//{
//    Console.WriteLine("Bebe más despacio o comprate otra ya solo quedan " + bebida.Cantidad + "ml");
//}
//else
//{
//    Console.WriteLine("Aún queda bastante bebida disfruta tus " + bebida.Cantidad + "ml");
//}

//Refresco sangria = new Refresco("Sangría", 700);
//sangria.Beber(20);
//Console.WriteLine("La bebida más deliciosa, te quedan " + sangria.Cantidad + "ml");

////Clase 4 INTERFACES

//var bebidaGasificada = new Jugo("Uva", 190, 20);
//MostrarRecomendacion(bebidaGasificada);
//Console.WriteLine("Tu bebida tiene: " + bebidaGasificada.Gas +" por ciento de Gas");

//var bebidaGasificada2 = new Refresco("Sangría", 500);
//MostrarRecomendacion(bebidaGasificada2);


//static void MostrarRecomendacion(IBebidaGasificada bebida)
//{
//    bebida.BotellasRecomendadas();
//}

//Console.WriteLine("\n");

//Clase 5 CONEXIOÓN A BD

RefrescoBD conn = new RefrescoBD();

SqlConnection con = conn.ObtenerConexion();

//Try para probar la conexión a la BD
try
{
    con.Open();
    Console.WriteLine("Conexión exitosa!");
}
catch (Exception ex)
{
    Console.WriteLine("Error: " + ex.Message);
}
finally
{
    con.Close(); // <- cierre manual
}
Console.WriteLine("\n");

//Obtención de los datos
//RefrescoBD refrescoBD = new RefrescoBD();
//var refrescos = refrescoBD.Get();
//foreach (var refre in refrescos)
//{ 
//    Console.WriteLine(refre.Nombre);
//}


Console.WriteLine("\n");
//Clase 6 CONSULTAS SQL

//Inserción de datos

//var refresco = new Refresco("Caballito", 400);
//refresco.Marca = "PepsiCo";
//refresco.Gas = 100;
//refrescoBD.Add(refresco);


//Edición de 1 dato

//var refresco = new Refresco("Caballito", 500);
//refresco.Marca = "PepsiCO";
//refresco.Gas = 60;
//refrescoBD.Edit(refresco,6);

//Eliminación de 1 dato

//refrescoBD.Eliminar(6);


//CLASE 7 SERIALIZACIÓN DE OBJETOS
//Es convertir tu objeto en un formato que pueda ser transportado, normalmente es un string y este string contiene un JSON o un XML,
//El convertirlo en JSON ayuda a la trnaferencia de datos y no tengas problemas al mandar información a otro lenguaje o otra tecnológia,
// Se utilizan en las consultas HTTP

{
    //var chesco = new Refresco("Jarrito", 30);
    //chesco.Gas = 60;
    //chesco.Marca = "Coca-Cola";
    //***************************

    //Se crea un JSON a partir de una cadena de texto o datos dados (SERIALIZACIÓN) OBJETO A STRING
    //string myJson = JsonSerializer.Serialize(chesco);
    //File.WriteAllText("objeto.txt",myJson);

    //****************************

    //****************************
    //Se crea un JSON a partir de un documento (DESSERIALIZACIÓN) STRING QUE CONTIENE JSON A OBJETO
    //string? myJson = File.ReadAllText("objeto.txt");
    //Refresco? chesco = JsonSerializer.Deserialize<Refresco>(myJson);

}


//CLASE 10 LINQ sirve para poder hacer consultas a colecciones, (bd,xml,arreglos, listas)


//{

//    List<int> numeros = new List<int>() { 1, 4, 5, 6, 7, 2, 3 };
//    //var numero7 = numeros.Where(x => x == 7).FirstOrDefault();
//    //Console.WriteLine(numero7);
//    var numerosOrdenados = numeros.OrderBy(x => x);
//    foreach (var numero in numerosOrdenados)
//    {
//        Console.WriteLine(numero);
//    }
//}


{

    List<Refresco> re = new List<Refresco>()
    {
        new Refresco() { Nombre = "Sangria", Cantidad = 300, Gas = 30, Marca = "Cola" },
        new Refresco() { Nombre = "Pepsi", Cantidad = 400, Gas = 60, Marca = "Cola-Loca" },
        new Refresco() { Nombre = "Fanta", Cantidad = 500, Gas = 10, Marca = "Cope" },
        new Refresco() { Nombre = "Sprite", Cantidad = 600, Gas = 50, Marca = "PepsiCo" },
        new Refresco() { Nombre = "Caballito", Cantidad = 700, Gas = 90, Marca = "MArcel" }
    };
    var refrescosOrdenados = from r in re
                                 orderby r.Marca
                                 select r;

        foreach (var ro in refrescosOrdenados)
        {
            Console.WriteLine($"{ro.Nombre} {ro.Marca}");
        }
    
}