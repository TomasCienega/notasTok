

using MetodosHttp.Models;
using System.Text.Json;


{
    var servicioPost = new MetodoPost();

    var respuesta = await servicioPost.PostM();

}

{
    var servicioPut = new MetodoPut();

    var respuesta = await servicioPut.PutM();

}

{
    var servicioDelete = new MetodoDelete();

    var respuesta = await servicioDelete.DeleteM();

}




