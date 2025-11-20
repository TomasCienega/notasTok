using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace MetodosHttp.Models
{
    public class MetodoPost
    {

        //Cambias el tipo a string? para SERIALIZAR
        //public async Task<string?> PostM()
        //Cambias el tipo a Post? para DESSERIALIZAR
        public async Task<Post?> PostM()
        {

            string url = "https://jsonplaceholder.typicode.com/posts";
            var client = new HttpClient();

            var post = new Post()
            {
                userId = 69,
                body = "Dar credenciales a usuario nuevo",
                title = "Usuario Nuevo"
            };

            var data = JsonSerializer.Serialize<Post>(post);
            HttpContent content =
                new StringContent(data, System.Text.Encoding.UTF8, "application/json");
            var httpResponse = await client.PostAsync(url, content);

            if (httpResponse.IsSuccessStatusCode)
            {
                //Serializar
                var ser_result = await httpResponse.Content.ReadAsStringAsync();

                //DESSERIALIZAR
                var des_Result = JsonSerializer.Deserialize<Post>(ser_result);

                //aquí solo se cambia la variable a utilizar

                //SERIALIZAR
                //return ser_result;
                
                //DESSERIALIZAR
                return des_Result;
            }
            return null;
        }
    }
}
