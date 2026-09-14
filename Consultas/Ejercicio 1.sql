/*create database MercadoLabo
go
use MercadoLabo
go

create table Provincias (
    ID tinyint primary key not null identity(1,1),
    Provincia varchar(50) not null
);
go
create table Localidades (
    ID_Localidad int primary key not null identity(1,1),
    ID_Provincia tinyint not null foreign key references Provincias(ID),
    Localidad varchar(200) not null
);
go
create table NivelesSituacionCrediticia (
    ID tinyint primary key not null identity(1,1),
    SituacionCrediticia varchar(50) not null
);
go
create table Usuarios (
    ID bigint primary key not null identity(1,1),
    DNI varchar(10) not null unique,
    Apellidos varchar(200) not null,
    Nombres varchar(200) not null,
    FechaNacimiento date not null check (FechaNacimiento <= getdate()),
    Genero char(1) null,
    ID_SituacionCrediticia tinyint not null foreign key references NivelesSituacionCrediticia(ID),
    Telefono varchar(20) null,
    Celular varchar(20) null,
    Mail varchar(250) not null,
    Domicilio varchar(500) not null,
    ID_Localidad int not null foreign key references Localidades(ID_Localidad)
);
go
create table Bancos (
    ID smallint primary key not null identity(1,1),
    Nombre varchar(100) not null
);
go
create table MarcasTarjeta (
    ID tinyint primary key not null identity(1,1),
    Marca varchar(100) not null
);
go
create table Billeteras (
    ID bigint primary key not null identity(1,1),
    ID_Usuario bigint not null unique foreign key references Usuarios(ID),
    Alias varchar(30) not null unique,
    FechaCreacion date not null,
    Saldo money not null default (0)
);
go
create table Tarjetas (
    ID bigint primary key not null identity(1,1),
    ID_Billetera bigint not null foreign key references Billeteras(ID),
    ID_MarcaTarjeta tinyint not null foreign key references MarcasTarjeta(ID),
    ID_Banco smallint not null foreign key references Bancos(ID),
    Numero varchar(16) not null check(len(rtrim(ltrim(Numero))) = 16),
    FechaEmision date not null,
    FechaVencimiento date not null,
    CodigoSeguridad varchar(4) not null,
    check(FechaEmision < FechaVencimiento)
);
go

insert into Provincias (Provincia)
values
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Misiones');

insert into Localidades (ID_Provincia, Localidad)
values
(1, 'Tigre'),
(1, 'San Fernando'),
(1, 'Vicente López'),
(1, 'San Isidro'),
(1, 'General Pacheco'),
(1, 'Pilar'),
(1, 'La Plata'),
(2, 'Córdoba Capital'),
(2, 'Villa Carlos Paz'),
(3, 'Rosario'),
(3, 'Santa Fe Capital'),
(4, 'Mendoza Capital'),
(4, 'Godoy Cruz'),
(5, 'Posadas'),
(5, 'Jardín América');

insert into NivelesSituacionCrediticia (SituacionCrediticia)
values
('Excelente'),
('Buena'),
('Regular'),
('Mala'),
('Muy mala');

insert into Bancos (Nombre)
values
('Banco Nación'),
('Banco Galicia'),
('Banco Santander'),
('BBVA'),
('Banco Macro'),
('Banco Provincia'),
('Banco Credicoop'),
('Banco Supervielle');

insert into MarcasTarjeta (Marca)
values
('Visa'),
('Mastercard'),
('American Express'),
('Cabal');

insert into Usuarios
(DNI, Apellidos, Nombres, FechaNacimiento, Genero, ID_SituacionCrediticia, Telefono, Celular, Mail, Domicilio, ID_Localidad)
values
('30124567', 'Gonzalez', 'Martin', '1983-05-14', 'M', 1, '01147451234', '1156234789', 'martin.gonzalez@gmail.com', 'Av. Cazón 1450', 1),

('32456789', 'Fernandez', 'Luciana', '1986-11-22', 'F', 2, null, '1167452398', 'luciana.fernandez@gmail.com', 'Constitución 832', 2),

('35678901', 'Rodriguez', 'Nicolas', '1991-03-08', 'M', 3, '01147981234', null, 'nicolas.rodriguez@hotmail.com', 'Maipú 2210', 3),

('38234567', 'Lopez', 'Camila', '1994-07-19', 'F', 1, null, '1134567890', 'camila.lopez@gmail.com', 'Belgrano 567', 4),

('40123456', 'Martinez', 'Federico', '1997-01-30', 'M', 4, null, null, 'federico.martinez@gmail.com', 'Boulogne Sur Mer 1845', 5),

('33567890', 'Perez', 'Sofia', '1988-09-12', 'F', 2, '01147341234', '1123456789', 'sofia.perez@yahoo.com', 'Rivadavia 932', 6),

('36789012', 'Sanchez', 'Diego', '1992-04-25', 'M', 5, null, '1167892345', 'diego.sanchez@gmail.com', 'Calle 7 1240', 7),

('29123456', 'Romero', 'Carolina', '1981-12-03', 'F', 1, '03514561234', null, 'carolina.romero@hotmail.com', 'Colón 445', 8),

('41567890', 'Diaz', 'Agustin', '1998-06-17', 'M', 3, null, '1145678923', 'agustin.diaz@gmail.com', 'San Martín 921', 9),

('34890123', 'Alvarez', 'Valentina', '1990-10-09', 'F', 2, '03414562341', '1156789012', 'valentina.alvarez@gmail.com', 'Oroño 350', 10),

('42345678', 'Torres', 'Matias', '2000-02-21', 'M', 4, null, '1162345678', 'matias.torres@hotmail.com', 'San Martín 1776', 11),

('31234567', 'Ruiz', 'Mariana', '1985-08-15', 'F', 1, '02614251234', null, 'mariana.ruiz@gmail.com', 'Las Heras 2350', 12),

('37890123', 'Ramirez', 'Joaquin', '1993-11-28', 'M', 5, null, null, 'joaquin.ramirez@gmail.com', 'San Martín 678', 13),

('39567890', 'Acosta', 'Florencia', '1996-05-06', 'F', 2, null, '1178901234', 'florencia.acosta@yahoo.com', 'Bolívar 1423', 14),

('28678901', 'Benitez', 'Sebastian', '1979-09-23', 'M', 3, '03743451234', '1134567821', 'sebastian.benitez@gmail.com', 'Avenida Libertad 890', 15),

('40678901', 'Medina', 'Julieta', '1997-12-11', 'F', 1, null, '1154321098', 'julieta.medina@hotmail.com', 'Av. Liniers 3200', 1),

('34345678', 'Herrera', 'Pablo', '1989-04-02', 'M', 4, '01147456789', null, 'pablo.herrera@gmail.com', 'Ituzaingó 554', 2),

('38765432', 'Castro', 'Natalia', '1995-07-27', 'F', 2, null, '1165432198', 'natalia.castro@gmail.com', 'Centenario 1205', 4),

('27345678', 'Molina', 'Gustavo', '1977-01-18', 'M', 5, '01147567890', null, 'gustavo.molina@yahoo.com', 'Hipólito Yrigoyen 778', 5),

('43123456', 'Silva', 'Milagros', '2001-03-14', 'F', 1, null, '1123987654', 'milagros.silva@gmail.com', 'Av. de Mayo 2540', 6);

insert into Billeteras
(ID_Usuario, Alias, FechaCreacion, Saldo)
values
(1, 'martin.gonzalez', '2024-01-15', 125000),
(2, 'luciana.fernandez', '2024-02-10', 78500),
(3, 'nicolas.rodriguez', '2024-02-28', 43000),
(4, 'camila.lopez', '2024-03-12', 210500),
(5, 'federico.martinez', '2024-03-20', 15000),
(6, 'sofia.perez', '2024-04-05', 96500),
(7, 'diego.sanchez', '2024-04-18', 3200),
(8, 'carolina.romero', '2024-05-01', 340000),
(9, 'agustin.diaz', '2024-05-16', 25000),
(10, 'valentina.alvarez', '2024-06-02', 187000),
(11, 'matias.torres', '2024-06-19', 12800),
(12, 'mariana.ruiz', '2024-07-03', 73000),
(13, 'joaquin.ramirez', '2024-07-21', 0),
(14, 'florencia.acosta', '2024-08-08', 145000),
(15, 'sebastian.benitez', '2024-08-25', 67000),
(16, 'julieta.medina', '2024-09-11', 223000),
(17, 'pablo.herrera', '2024-10-04', 38500),
(18, 'natalia.castro', '2024-10-22', 119000),
(19, 'gustavo.molina', '2024-11-09', 270000),
(20, 'milagros.silva', '2024-12-01', 54000);

insert into Tarjetas
(ID_Billetera, ID_MarcaTarjeta, ID_Banco, Numero, FechaEmision, FechaVencimiento, CodigoSeguridad)
values
(1, 1, 1, '4500123412340001', '2023-01-10', '2028-01-31', '123'),
(2, 2, 2, '5200123412340002', '2023-03-15', '2028-03-31', '456'),
(3, 1, 3, '4500123412340003', '2024-02-12', '2029-02-28', '321'),
(4, 3, 4, '3700123412340004', '2022-08-20', '2027-08-31', '1256'),
(5, 2, 5, '5200123412340005', '2024-04-11', '2029-04-30', '789'),
(6, 1, 6, '4500123412340006', '2023-06-05', '2028-06-30', '245'),
(7, 4, 7, '5800123412340007', '2024-01-22', '2029-01-31', '587'),
(8, 1, 1, '4500123412340008', '2022-11-18', '2027-11-30', '965'),
(9, 2, 2, '5200123412340009', '2024-05-14', '2029-05-31', '417'),
(10, 1, 3, '4500123412340010', '2023-09-09', '2028-09-30', '721'),
(11, 2, 4, '5200123412340011', '2024-03-01', '2029-03-31', '658'),
(12, 3, 5, '3700123412340012', '2023-02-13', '2028-02-29', '1458'),
(13, 1, 6, '4500123412340013', '2024-06-17', '2029-06-30', '872'),
(14, 4, 7, '5800123412340014', '2023-10-22', '2028-10-31', '362'),
(15, 2, 8, '5200123412340015', '2024-01-05', '2029-01-31', '915'),
(16, 1, 1, '4500123412340016', '2023-07-14', '2028-07-31', '524'),
(17, 2, 2, '5200123412340017', '2024-08-06', '2029-08-31', '371'),
(18, 1, 3, '4500123412340018', '2023-12-19', '2028-12-31', '649'),
(19, 3, 4, '3700123412340019', '2022-05-27', '2027-05-31', '2519'),
(20, 2, 5, '5200123412340020', '2024-09-03', '2029-09-30', '803'),

(1, 2, 2, '5200123412340021', '2024-05-12', '2029-05-31', '147'),
(4, 1, 6, '4500123412340022', '2023-11-15', '2028-11-30', '258'),
(6, 2, 3, '5200123412340023', '2024-02-24', '2029-02-28', '369'),
(8, 3, 4, '3700123412340024', '2023-04-18', '2028-04-30', '1472'),
(10, 1, 1, '4500123412340025', '2024-07-30', '2029-07-31', '951'),
(12, 2, 8, '5200123412340026', '2023-08-16', '2028-08-31', '753'),
(14, 1, 5, '4500123412340027', '2024-06-21', '2029-06-30', '852'),
(16, 4, 7, '5800123412340028', '2023-09-11', '2028-09-30', '456'),
(18, 2, 6, '5200123412340029', '2024-03-28', '2029-03-31', '654'),
(20, 1, 2, '4500123412340030', '2024-10-15', '2029-10-31', '357');*/

Select ID, Apellidos, Nombres, FechaNacimiento from Usuarios