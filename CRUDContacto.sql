CREATE DATABASE CRUDCORE

ALTER DATABASE dbcrudcorea
MODIFY NAME = CRUDCORE;

use CRUDCORE

create table contacto(
IdContacto int identity(1,1) primary key,
Nombre varchar(50),
Telefono  varchar(50),
Correo varchar(50)
)

select * from contacto;

create procedure sp_Listar
as 
begin 
	select * from contacto
end

EXEC sp_helptext 'sp_Listar';

create procedure sp_Obtener(
@IdContacto int
)
as
begin
	select * from contacto where IdContacto = @IdContacto
end

create procedure sp_Guardar(
@Nombre varchar(100),
@Telefono varchar(100),
@Correo varchar(100)
)
as
begin
	insert into contacto(Nombre, Telefono, Correo) values (@Nombre, @Telefono, @Correo);
end

create procedure sp_Editar(
@IdContacto int,
@Nombre varchar(100),
@Telefono varchar(100),
@Correo varchar(100)
)
as 
begin
	update contacto set Nombre = @Nombre, Telefono = @Telefono, Correo = @Correo where IdContacto = @IdContacto;
end

create procedure sp_Eliminar(
@IdContacto int
)
as 
begin
	delete from contacto where IdContacto = @IdContacto;
end