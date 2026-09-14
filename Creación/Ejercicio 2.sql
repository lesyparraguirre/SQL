/*Armar una base de datos y crear las siguientes tablas:
Autores: ID, Nombre, Pais de nacimiento.
Libro: ID, Fecha de publicación, Titulo, IDAutor.
Clientes: ID, Nombre, Apellido, Mail.
Venta: ID, IDCliente, IDLibro, Fecha, Puntaje, Importe.
Aclaraciones: 
•	Todos los campos ID deben ser autonuméricos
•	La fecha de publicación de un libro no puede ser posterior a la fecha actual.
•	La fecha de una venta no puede ser posterior a la fecha actual.
•	El mail del cliente no puede repetirse.
•	El puntaje puede ser opcional.*/
create database Creacion_2DB
go
use Creacion_2DB
go
create table Autor(
	ID tinyint primary key not null identity (1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Pais varchar(50)
)
create table Libro(
	ID tinyint primary key not null identity (1, 1),
	FechaPublicacion date not null,
	Titulo varchar(50) not null,
	IDAutor tinyint foreign key references Autor(ID)
)
create table Cliente(
	ID tinyint primary key not null identity (1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Mail varchar(50) unique
)
create table Venta(
	ID tinyint primary key not null identity (1, 1),
	IDCliente tinyint not null foreign key references Cliente(ID),
	IDLibro tinyint not null foreign key references Libro(ID),
	Fecha date not null check (Fecha <= getdate()),
	Puntaje tinyint null,
	Importe money not null check (Importe > 0)
)