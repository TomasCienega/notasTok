using AppCrudEmpDep.Models;
using AppCrudEmpDep.Repositorios.Contrato;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;

namespace AppCrudEmpDep.Repositorios.Implementacion
{
    public class DepartamentoRepository : IGenericRepository<Departamento>
    {
        private readonly string _cadenaSQL="";
        //Obtiene la cadena de conexión dentro del archivo json
        public DepartamentoRepository(IConfiguration configuracion)
        {
            _cadenaSQL = configuracion.GetConnectionString("CadenaSQL");
        }

        public async Task<List<Departamento>> Lista()
        {
            List<Departamento> _lista = new List<Departamento>();

            using(var conexion = new SqlConnection(_cadenaSQL))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ListarDepartamentos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using(var dr = await cmd.ExecuteReaderAsync())
                {
                    while (await dr.ReadAsync())
                    {
#pragma warning disable CS8601 // Possible null reference assignment.
                        _lista.Add(new Departamento
                        {
                            idDepartamento = Convert.ToInt32(dr["idDepartamento"]),
                            nombre = dr["nombre"].ToString()
                        });
#pragma warning restore CS8601 // Possible null reference assignment.
                    }
                }
            }
            return _lista;
        }

        public async Task<bool> Guardar(Departamento modelo)
        {
            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_GuardarDepartamento", conn);
                //Propiedad - Parameters
                //Metodo - AddWithValue
                cmd.Parameters.AddWithValue("nombre", modelo.nombre);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if(filas_afectadas > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Editar(Departamento modelo)
        {
            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_EditarDepartamento", conn);
                cmd.Parameters.AddWithValue("idDepartamento", modelo.idDepartamento);
                cmd.Parameters.AddWithValue("nombre", modelo.nombre);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if(filas_afectadas > 0)
                    return true;
                else
                    return false;
            }
        }

        public async Task<bool> Eliminar(int id)
        {
            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_EliminarDepartamento", conn);
                cmd.Parameters.AddWithValue("idDepartamento",id);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if (filas_afectadas > 0)
                    return true;
                else
                    return false;
            }
        }

    }
}
