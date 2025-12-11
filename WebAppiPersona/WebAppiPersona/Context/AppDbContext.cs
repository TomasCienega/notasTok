using Microsoft.EntityFrameworkCore;
using WebAppiPersona.Models;

namespace WebAppiPersona.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
            
        }
        public DbSet<Persona> Personas { get; set; }
    }
}
