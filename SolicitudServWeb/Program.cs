
using SolicitudServWeb.Models;
using System.Text.Json;

await SolicitudWebAsync();

async Task SolicitudWebAsync()
{
    string url = "https://jsonplaceholder.typicode.com/posts";
    HttpClient client = new HttpClient();

    var httpResponse = await client.GetAsync(url);

    if(httpResponse.IsSuccessStatusCode)
    {
        var content = await httpResponse.Content.ReadAsStringAsync();
        List<Post>? posts = JsonSerializer.Deserialize<List<Post>>(content);

        //var posts = JsonSerializer.Deserialize<List<Post>>(content);
    }

}