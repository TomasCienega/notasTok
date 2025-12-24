using Microsoft.Data.SqlClient;
using System.Data;
using System.Collections.Generic;

public class ProductoRepository
{
    private readonly string _connectionString = "Server=TU_SERVIDOR;Database=TU_BASE;User Id=TU_USUARIO;Password=TU_PASSWORD;TrustServerCertificate=True;";

    // CREATE
    public void Insertar(string nombre, decimal precio)
    {
        using var connection = new SqlConnection(_connectionString);
        connection.Open();

        using var cmd = new SqlCommand("sp_InsertarProducto", connection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
        cmd.Parameters.Add(new SqlParameter("@Precio", precio));
        cmd.ExecuteNonQuery();
    }

    // READ: Obtener todos
    public List<Producto> ObtenerTodos()
    {
        var lista = new List<Producto>();

        using var connection = new SqlConnection(_connectionString);
        connection.Open();

        using var cmd = new SqlCommand("sp_ObtenerTodosProductos", connection);
        cmd.CommandType = CommandType.StoredProcedure;

        using var reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            lista.Add(new Producto
            {
                Id = (int)reader["Id"],
                Nombre = (string)reader["Nombre"],
                Precio = (decimal)reader["Precio"]
            });
        }
        return lista;
    }

    // READ: Obtener por Id
    public Producto? ObtenerPorId(int id)
    {
        using var connection = new SqlConnection(_connectionString);
        connection.Open();

        using var cmd = new SqlCommand("sp_ObtenerProductoPorId", connection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@Id", id));

        using var reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            return new Producto
            {
                Id = (int)reader["Id"],
                Nombre = (string)reader["Nombre"],
                Precio = (decimal)reader["Precio"]
            };
        }
        return null;
    }

    // UPDATE: Regresa el Id actualizado o -1 si no actualizó nada
    public int Actualizar(int id, string nombre, decimal precio)
    {
        using var connection = new SqlConnection(_connectionString);
        connection.Open();

        using var cmd = new SqlCommand("sp_ActualizarProducto", connection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@Id", id));
        cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
        cmd.Parameters.Add(new SqlParameter("@Precio", precio));

        int filasAfectadas = cmd.ExecuteNonQuery();
        return filasAfectadas > 0 ? id : -1;
    }

    // DELETE: Regresa el Id eliminado o -1 si no eliminó nada
    public int Eliminar(int id)
    {
        using var connection = new SqlConnection(_connectionString);
        connection.Open();

        using var cmd = new SqlCommand("sp_EliminarProducto", connection);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@Id", id));

        int filasAfectadas = cmd.ExecuteNonQuery();
        return filasAfectadas > 0 ? id : -1;
    }
}