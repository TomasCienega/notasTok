
const _modeloEmpleado = {
    idEmpleado: 0,
    nombreCompleto: "",
    idDepartamento: 0,
    sueldo: 0,
    fechaContrato:""
}

function MostrarEmpleados() {
    //Hace peticion al servidor
    fetch("/Home/listaEmpleados")
        /*
        El método .then() en una petición fetch se utiliza para manejar la promesa que devuelve fetch cuando se resuelve con una respuesta HTTP.
        Esta promesa se resuelve con un objeto Response que contiene la respuesta del servidor, incluyendo el cuerpo de la respuesta y sus cabeceras.
        */
        .then(response => {
            // Promise.reject(response) “Algo salió mal, cancela esto y mándalo al camino del error”
            return response.ok ? response.json() : Promise.reject(response)
        })
        /*
            👉 responseJson NO es el mismo response
            👉 responseJson es lo que REGRESA el then anterior
        */
        .then(responseJson => {
            if (responseJson.length > 0) {

                //Pintar datos en la tabla

                //“Borra todo el contenido que tenga el <tbody>”
                $("#tablaEmpleados tbody").html("");//Limpia

                responseJson.forEach((empleado) => {
                    // En HTML + jQuery, .append significa agregar contenido dentro de un elemento, sin borrar lo que ya tiene.
                    // “Busca el <tbody> que está dentro del elemento con id tablaEmpleados”
                    $("#tablaEmpleados tbody").append(
                        $("<tr>").append(
                            $("<td>").text(empleado.nombreCompleto),
                            $("<td>").text(empleado.refDepartamento.nombre),
                            $("<td>").text(empleado.sueldo),
                            $("<td>").text(empleado.fechaContrato),
                            $("<td>").append(
                                /*
                                .data() sirve para guardar información dentro de un elemento HTML, sin que se vea en pantalla.
                                🟢 Clave: "dataEmpleado"
                                🟢 Valor: el objeto empleado completo
                                */
                                $("<button>").addClass("btn btn-primary btn-sm boton-editar-empleado").text("Editar").data("dataEmpleado", empleado),
                                $("<button>").addClass("btn btn-danger btn-sm ms-2 boton-eliminar-empleado").text("Eliminar").data("dataEmpleado", empleado)
                            )
                        )
                    )
                })
            }
        })
}
// “No ejecutes nada de lo que sigue hasta que el HTML ya esté cargado.”
document.addEventListener("DOMContentLoaded", function () {

    MostrarEmpleados();

    fetch("/Home/listaDepartamentos")
        .then(response => {
            /* response.ok → ¿la petición fue exitosa? (status 200–299)
              Si sí 👉 convierte la respuesta a JSON
              Si no 👉 forza un error con Promise.reject
              “Si el servidor respondió bien, dame los datos.
              Si respondió mal, mándalo al error.”
            */
            return response.ok ? response.json() : Promise.reject(response)
        })
        .then(responseJson => {

            if (responseJson.length > 0) {
                // Cada item es un departamento, por ejemplo:
                responseJson.forEach((item) => {
                    $("#cboDepartamento").append(
                        /*
                        Selecciona el <select id="cboDepartamento">
                        Agrega una nueva opción:
                        value = id del departamento
                        texto visible = nombre del departamento
                        */
                       /*
                            .val(item.idDepartamento)
                            Le asigna el atributo value al <option>:
                            Si el item es:
                            { idDepartamento: 3, nombre: "Ventas" }
                            Entonces ahora el <option> queda así:
                            <option value="3"></option>
                            Para qué sirve el value
                            Es lo que se manda al backend
                            Es lo que recuperas cuando haces:
                            $("#cboDepartamento").val()
                            .text(item.nombre)
                            Define el texto visible del <option>.
                            $("#cboDepartamento").val()
                            <option value="3">Ventas</option>
                       */
                        $("<option>").val(item.idDepartamento).text(item.nombre)
                    )
                })
            }

        })
    //Esta fuera porque no depende del fetch.
    //Esto solo inicializa un componente visual (el datepicker) sobre un input.
    /*
        El datepicker se inicializa al cargar la página porque es un componente visual independiente. 
        El fetch se usa solo para obtener datos del servidor. 
        Mezclarlos haría que el calendario dependa innecesariamente de la respuesta del backend.

        fetch = ir por información al archivo
        datepicker = prender la luz del cuarto
    */
    $("#txtFechaContratacion").datepicker({
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHighlight: true
    })
    /*
    false
    Indica que el evento se maneja en fase normal (bubbling)
    En la práctica 👉 no te preocupes, casi siempre va en false
    */
}, false)

function MostrarModal() {
    $("#txtNombreCompleto").val(_modeloEmpleado.nombreCompleto);
    $("#cboDepartamento").val(_modeloEmpleado.idDepartamento == 0 ? $("#cboDepartamento option:first").val() : _modeloEmpleado.idDepartamento);
    $("#txtSueldo").val(_modeloEmpleado.sueldo);
    $("#txtFechaContratacion").val(_modeloEmpleado.fechaContrato);

    $("#modalEmpleado").modal("show");
}

//Busca si dentro del document se aplico un evento click en el boton 
$(document).on("click", ".boton-nuevo-empleado", function () {
    //Setea los datos del empleado como si fuera uno nuevo
    _modeloEmpleado.idEmpleado = 0;
    _modeloEmpleado.nombreCompleto = "";
    _modeloEmpleado.idDepartamento = 0;
    _modeloEmpleado.sueldo = 0;
    _modeloEmpleado.fechaContrato = "";

    MostrarModal();
})

//Busca si dentro del document se aplico un evento click en el boton 
$(document).on("click", ".boton-editar-empleado", function () {

    //“Agarra el empleado que guardé antes dentro de este elemento y guárdalo en la variable _empleado.”
    //this hace referencia al boton .boton-editar-empleado dentro de la funcion MostrarEmpleados() 
    const _empleado = $(this).data("dataEmpleado");

    //Setea los datos del empleado con los datos guardados en dataEmpleado dentro de MostrarEmpleados()
    _modeloEmpleado.idEmpleado = _empleado.idEmpleado;
    _modeloEmpleado.nombreCompleto = _empleado.nombreCompleto;
    _modeloEmpleado.idDepartamento = _empleado.refDepartamento.idDepartamento;
    _modeloEmpleado.sueldo = _empleado.sueldo;
    _modeloEmpleado.fechaContrato = _empleado.fechaContrato;

    MostrarModal();
})
    
//Busca si dentro del document se aplico un evento click en el boton 
$(document).on("click", ".boton-guardar-cambios-empleado", function () {

    const _modelo = {
        idEmpleado: _modeloEmpleado.idEmpleado,
        nombreCompleto: $("#txtNombreCompleto").val(),
        refDepartamento: {
            idDepartamento: $("#cboDepartamento").val()
        },
        sueldo: $("#txtSueldo").val(),
        fechaContrato: $("#txtFechaContratacion").val()
    }

    //.boton-guardar-cambios-empleado como el boton ese se utiliza en dos partes tanto en guardar como editar le tenemos que indicar que funcion tendra
    // por ejemplo si se edita ya tendria un id y no entraria aqui, pero si por ejemplo ejecutas el nuevo usuario vendria sin id y por ende entraria a otro metodo
    /*
        Resumen corto y firme
        Sí, al editar el ID ya tiene valor
        La comparación existe porque:
        el mismo método guarda crear + editar
        Si solo editaras, no haría falta
        El ID es la bandera que decide INSERT o UPDATE
    */
    if (_modeloEmpleado.idEmpleado == 0) {

        fetch("/Home/guardarEmpleado", {
            method: "POST",
            headers: { "Content-Type": "application/json; charset=utf-8" },
            body: JSON.stringify(_modelo)
        })
            .then(response => {
                return response.ok ? response.json() : Promise.reject(response)
            })
            .then(responseJson => {

                if (responseJson.valor) {
                    $("#modalEmpleado").modal("hide");
                    Swal.fire("Listo!", "Empleado fue creado", "success");
                    MostrarEmpleados();
                }
                else {
                    Swal.fire("Lo Sentimos!", "No se pudo crear", "error");
                }
            })
    }
    else {
        fetch("/Home/editarEmpleado", {
            method: "PUT",
            headers: { "Content-Type": "application/json; charset=utf-8" },
            body: JSON.stringify(_modelo)
        })
        .then(response => {
            return response.ok ? response.json() : Promise.reject(response)
        })
        .then(responseJson => {

            if (responseJson.valor) {
                $("#modalEmpleado").modal("hide");
                Swal.fire("Listo!", "Empleado fue actualizado", "success");
                MostrarEmpleados();
            }
            else {
                Swal.fire("Lo Sentimos!", "No se pudo actualizar", "error");
            }
        })
    }

})

//Busca si dentro del document se aplico un evento click en el boton 
$(document).on("click", ".boton-eliminar-empleado", function () {

    //“Agarra el empleado que guardé antes dentro de este elemento y guárdalo en la variable _empleado.”
    //this hace referencia al boton .boton-editar-empleado dentro de la funcion MostrarEmpleados() 
    const _empleado = $(this).data("dataEmpleado");

    Swal.fire({
        title: "Esta Seguro?",
        text: `Eliminar empleado "${_empleado.nombreCompleto}"`,
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Si, eliminar",
        cancelButtonText: "No, volver"
    })
    .then((result) => {
        if (result.isConfirmed) {
            fetch(`/Home/eliminarEmpleado?idEmpleado=${_empleado.idEmpleado}`, {
                method: "DELETE"
            })
            .then(response => {
                return response.ok ? response.json() : Promise.reject(response)
            })
            .then(responseJson => {

                if (responseJson.valor) {
                    Swal.fire("Listo!", "Empleado fue eliminado", "success");
                    MostrarEmpleados();
                }
                else {
                    Swal.fire("Lo Sentimos!", "No se pudo eliminar", "error");
                }
            })
        }
    })

})