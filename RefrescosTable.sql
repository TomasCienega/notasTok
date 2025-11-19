create database BebidaGaseosa;
use BebidaGaseosa;
create table refresco 
(
	id int primary key identity(1,1),
	nombre varchar(50),
	marca varchar(60),
	gas int,
	cantidad int
)
insert into refresco values ('Sangria','Coca-Cola',60,500),('Coca-Cola','Coca-Cola',80,500),
('Fanta','Coca-Cola',70,500),('Sprite','Coca-Cola',30,600),('Pepsi','Pepsi',100,1000)
select * from refresco;