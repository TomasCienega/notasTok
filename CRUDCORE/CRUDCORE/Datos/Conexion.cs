using Microsoft.Data.SqlClient;

namespace CRUDCORE.Datos
{
    public class Conexion
    {

        public string? cadenaSQL = string.Empty;

        public Conexion() 
        { 
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            cadenaSQL = builder.GetSection("ConnectionStrings:CadenaSQL").Value;
        }

        public string getCadenaSQL()
        {
            return cadenaSQL;
        }
        // otra forma de hacer el metodo anterior con una expresion :
        // public string getCadena() => cadenaSQL;
        public Conexion(string cadenaSQL) 
        { 
            this.cadenaSQL = cadenaSQL;
        }


    }
}
