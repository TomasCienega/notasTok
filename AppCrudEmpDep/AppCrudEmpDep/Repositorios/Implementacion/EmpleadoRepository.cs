using AppCrudEmpDep.Models;
using AppCrudEmpDep.Repositorios.Contrato;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;

namespace AppCrudEmpDep.Repositorios.Implementacion
{
    public class EmpleadoRepository : IGenericRepository<Empleado>
    {
        private readonly string _cadenaSQL = "";
        public EmpleadoRepository(IConfiguration configuracion)
        {
            _cadenaSQL = configuracion.GetConnectionString("CadenaSQL");
        }

        public async Task<List<Empleado>> Lista()
        {
            List<Empleado> _lista = new List<Empleado>();

            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_ListarEmpleados", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                /*
                 ExecuteReaderAsync() ejecuta la consulta y devuelve un SqlDataReader.
                 Luego, usando ReadAsync(), se recorren las filas del resultado una por una de forma asíncrona.
                 */
                //Se ejecuta el SQL(SP)
                using (var dr = await cmd.ExecuteReaderAsync())
                {
                    //Se leen las filas
                    while (await dr.ReadAsync())
                    {
                        _lista.Add(new Empleado
                        {
                            idEmpleado = Convert.ToInt32(dr["idEmpleado"]),
                            nombreCompleto = dr["nombreCompleto"].ToString(),
                            refDepartamento = new Departamento()
                            {
                                idDepartamento = Convert.ToInt32(dr["idDepartamento"]),
                                nombre = dr["nombre"].ToString()
                            },
                            sueldo = dr.GetInt32("sueldo"),
                            fechaContrato = dr["fechaContrato"].ToString()
                        });
                    }
                }
            }
            return _lista;
        }

        public async Task<bool> Guardar(Empleado modelo)
        {
            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_GuardarEmpleado", conn);
                cmd.Parameters.AddWithValue("nombreCompleto", modelo.nombreCompleto);
                cmd.Parameters.AddWithValue("idDepartamento", modelo.refDepartamento.idDepartamento);
                cmd.Parameters.AddWithValue("sueldo", modelo.sueldo);
                cmd.Parameters.AddWithValue("fechaContrato", modelo.fechaContrato);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if (filas_afectadas > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public async Task<bool> Editar(Empleado modelo)
        {
            using (var conn = new SqlConnection(_cadenaSQL))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("sp_EditarEmpleado", conn);
                cmd.Parameters.AddWithValue("idEmpleado", modelo.idEmpleado);
                cmd.Parameters.AddWithValue("nombreCompleto", modelo.nombreCompleto);
                cmd.Parameters.AddWithValue("idDepartamento", modelo.refDepartamento.idDepartamento);
                cmd.Parameters.AddWithValue("sueldo", modelo.sueldo);
                cmd.Parameters.AddWithValue("fechaContrato", modelo.fechaContrato);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if(filas_afectadas>0)
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
                SqlCommand cmd = new SqlCommand("sp_EliminarEmpleado", conn);
                cmd.Parameters.AddWithValue("idEmpleado", id);
                cmd.CommandType = CommandType.StoredProcedure;

                int filas_afectadas = await cmd.ExecuteNonQueryAsync();

                if( filas_afectadas > 0)  
                    return true; 
                else
                    return false;   
            }
        }

    }
}
