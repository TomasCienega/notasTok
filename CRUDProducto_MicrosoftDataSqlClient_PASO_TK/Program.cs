using System;

class Program
{
    static void Main()
    {
        var repo = new ProductoRepository();

        // Insertar
        repo.Insertar("Laptop", 20000m);

        // Leer todos
        var productos = repo.ObtenerTodos();
        foreach (var p in productos)
            Console.WriteLine($"{p.Id} - {p.Nombre} - {p.Precio:C}");

        // Obtener por Id
        var producto = repo.ObtenerPorId(1);
        if (producto != null)
            Console.WriteLine($"Producto 1: {producto.Nombre} - {producto.Precio:C}");

        // Actualizar
        int idActualizado = repo.Actualizar(1, "Laptop Pro", 22000m);
        Console.WriteLine(idActualizado != -1 ? $"Producto {idActualizado} actualizado" : "No se actualizó");

        // Eliminar
        int idEliminado = repo.Eliminar(1);
        Console.WriteLine(idEliminado != -1 ? $"Producto {idEliminado} eliminado" : "No se eliminó");
    }
}