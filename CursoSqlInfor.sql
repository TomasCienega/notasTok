create database cursosql;
use cursosql;
alter database cursosql modify name = cursoSQL;
create table Empleados
(
	empleadoId int,
	nombre varchar(20),
	apellido varcahr(30)
);

--para ver tablas dentro de la bd seleccionada
exec sp_help Empleados;

insert into Empleados (nombre,apellido) values ('Tomas','Cienega');

insert into Empleados values ('Tomas','Cienega');

--Modificar nombre de tabla
exec sp_rename 'Empleados', 'Usuarios';

drop table Empleados;

drop database cursoSQL;

-- elimina todos los registros de la tabla sin eliminar la tabla
truncate table Empleados;

-- hace lo mismo que truncate
delete from Empleados;

delete from Empleados where empleadoId = 1;

--para agregar una nueva columna 
alter table Empleados add direccion varchar(100);

--eliminar columna 
alter table Empleados drop column direccion;

/*cambiar nombre de los campos o encabezados de una tabla*/
exec sp_rename 'Empleados.direccion', 'direccionEmpl';