create database DBEmpl;
use DBEmpl;
create table Departamento
(
	idDepartamento int primary key identity(1,1),
	nombre varchar(50)
);

create table Empleado
(
	idEmpleado int primary key identity(1,1),
	nombreCompleto varchar(50),
	idDepartamento int references Departamento(idDepartamento),
	sueldo int,
	fechaContrato date
);

insert into Departamento(nombre) values
('Administración'),
('Marketing'),
('Ventas'),
('Comercio');

insert into Empleado(nombreCompleto,idDepartamento,sueldo,fechaContrato) values
('Adrian Torres',1,1500,GETDATE());

--=================== CREAR PROCEDIMIENTOS ALMACENADOS =============================

create procedure sp_ListarDepartamentos
as
begin
	select idDepartamento,nombre from Departamento;
end

create procedure sp_ListarEmpleados
as
begin
	set dateformat dmy
	select e.idEmpleado,e.nombreCompleto,d.idDepartamento,
	d.nombre,e.sueldo,
	CONVERT(char(10),e.fechaContrato,103) as 'fechaContrato'
	from Empleado as e
	inner join Departamento as d on e.idDepartamento = d.idDepartamento;
end

create procedure sp_GuardarEmpleado
(
	@nombreCompleto varchar(50),
	@idDepartamento int,
	@sueldo int,
	@fechaContrato varchar(10)
)
as
begin
	
	set dateformat dmy
	insert into Empleado(nombreCompleto,idDepartamento,sueldo,fechaContrato)
	values
	(@nombreCompleto,@idDepartamento,@sueldo,CONVERT(date,@fechaContrato))
end

create procedure sp_EditarEmpleado
(
	@idEmpleado int,
	@nombreCompleto varchar(50),
	@idDepartamento int,
	@sueldo int,
	@fechaContrato varchar(10)
)
as
begin
	
	set dateformat dmy

	update Empleado set
	nombreCompleto = @nombreCompleto,
	idDepartamento = @idDepartamento,
	sueldo = @sueldo,
	fechaContrato = CONVERT(date,@fechaContrato)
	where idEmpleado = @idEmpleado

end

create procedure sp_EliminarEmpleado
(
	@idEmpleado int
)
as
begin
	delete from Empleado
	where idEmpleado = @idEmpleado
end