using Microsoft.EntityFrameworkCore;
using RazorPagesMovie.Data;
using RazorPagesMovie.Models;

namespace RazorPagesMovie.SeedData
{
    public class SeedData
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            using (var context = new RazorPagesMovieContext(
                serviceProvider.GetRequiredService<DbContextOptions<RazorPagesMovieContext>>()))
            {
                if (context == null || context.Movie == null)
                {
                    throw new ArgumentNullException("Null RazorMoviesContext");
                }
                if (context.Movie.Any())
                {
                    return;
                }

                context.Movie.AddRange(
                    new Movie
                    {
                        Title = "El planeta del tesoro",
                        ReleaseDate = DateTime.Parse("1999-01-08"),
                        Genre = "Animación",
                        Price = 200,
                        Rating = "R"
                    },
                    new Movie
                    {
                        Title = "Transformers",
                        ReleaseDate = DateTime.Parse("2010-11-01"),
                        Genre = "Acción",
                        Price = 200,
                        Rating = "G"
                    },
                    new Movie
                    {
                        Title = "K-POP Demon hunters",
                        ReleaseDate = DateTime.Parse("2025-01-08"),
                        Genre = "Animación",
                        Price = 200,
                        Rating = "N"
                    },
                    new Movie
                    {
                        Title = "El planeta de los simios",
                        ReleaseDate = DateTime.Parse("1980-12-25"),
                        Genre = "Ciencia Ficción",
                        Price = 200,
                        Rating = "+18"
                    }

                );

                context.SaveChanges();
            }
        }
    }
}
