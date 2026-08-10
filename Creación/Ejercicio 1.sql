/*
Ejercicio 1
Armar una base de datos y crear las siguientes tablas:
Areas: ID, Nombre, Presupuesto, Mail.
Empleados: Legajo, IDArea, apellidos, Nombres, Fecha de nacimiento, Mail, Telefono, sueldo.
Aclaraciones: 
•	El IDArea del empleado debe existir en Areas.
•	La fecha de nacimiento debe ser menor a la actual.
•	El mail no puede repetirse.
•	El teléfono es opcional.
•	El sueldo debe ser mayor a 0.
•	El ID debe ser autonumérico.
•	El presupuesto debe ser mayor a 0.
*/
create database CreacionDB
go
Use CreacionDB
go
Create Table Areas(
	ID tinyint primary key not null identity(1, 1),
	Nombre varchar(50) not null,
	Presupuesto money not null check(Presupuesto > 0),
	Mail varchar(100) not null unique
)

Create Table Empleado(
	Legajo int primary key not null,
	IDArea tinyint null foreign key references Areas(ID),
	Apellido varchar(100) not null,
	Nombres varchar(100) not null,
	FechaNacimiento date null check (FechaNacimiento <= getdate())
)