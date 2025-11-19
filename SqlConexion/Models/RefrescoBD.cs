using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClasesyObjetos.Models
{
    internal class RefrescoBD
    {
        private string cadena = "Server=DESKTOP-JJ9DM3F\\SQLEXPRESS;Database=BebidaGaseosa;Integrated Security=True;TrustServerCertificate=True;";
        //private string cadena2 = "Data Source=localhost;Initial Catalog=BebidaGaseosa;User=sa;Password=1234";


        public SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(cadena);
            return conexion;
        }

        public List<Refresco> Get()
        {
            List<Refresco> refrescos = new List<Refresco>();

            string query = "select nombre, marca, gas, cantidad " +
                "from refresco";

            using (SqlConnection connection = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand(query, connection);
                connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string Nombre = reader.GetString(0);
                    int Cantidad = reader.GetInt32(3);

                    Refresco refre = new Refresco(Nombre,Cantidad);

                    refre.Gas = reader.GetInt32(2);
                    refre.Marca = reader.GetString(1);

                    refrescos.Add(refre);
                }

                reader.Close();
                connection.Close();
            }

            return refrescos;
        }
    }
}
