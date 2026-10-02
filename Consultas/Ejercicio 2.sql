/*
Create Database PedidosyClientes
GO
Use PedidosyClientes
Go
CREATE TABLE Clientes (
    IdCliente BIGINT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(255) NULL,
    Telefono VARCHAR(20) null,
    Celular VARCHAR(20) null,
    Ciudad VARCHAR(100) null,
    FechaAlta Date DEFAULT GETDATE()
);

CREATE TABLE Pedidos (
    IdPedido BIGINT PRIMARY KEY IDENTITY(1,1),
    IdCliente BIGINT FOREIGN KEY REFERENCES Clientes(IdCliente),
    FechaPedido DATETIME DEFAULT GETDATE(),
    Estado VARCHAR(50),
    MontoTotal DECIMAL(10, 2)
);
set dateformat YMD

INSERT INTO Clientes (Nombre, Apellido, CorreoElectronico, Telefono, Celular, Ciudad, FechaAlta)
VALUES 
('Joaquín', 'Pérez', 'joaquin.perez@mail.com', '011-1234-5678', NULL, 'Buenos Aires', '2020-05-10'),
('Valentina', 'Gómez', NULL, NULL, '11-2345-6789', 'La Plata', '2019-03-15'),
('Mateo', 'López', 'mateo.lopez@mail.com', '0351-5678-1234', NULL, 'Córdoba', '2022-07-20'),
('Martina', 'Rodríguez', NULL, NULL, NULL, 'Rosario', '2018-08-25'),
('Santiago', 'Fernández', 'santiago.fernandez@mail.com', '234-432-1223', '261-4321-9876', 'Mendoza', '2021-09-12'),
('Sofía', 'Martínez', 'sofia.martinez@mail.com', '0381-2345-6789', '381-8765-4321', 'Tucumán', '2023-01-30'),
('Lucas', 'González', NULL, '0294-1234-5678', NULL, 'Bariloche', '2017-11-05'),
('Catalina', 'Giménez', 'catalina.gimenez@mail.com', NULL, NULL, 'Neuquén', '2020-04-17'),
('Thiago', 'Silva', 'thiago.silva@mail.com', '0291-6543-9876', NULL, 'Bahía Blanca', '2019-02-22'),
('Camila', 'Romero', NULL, '0264-3456-7890', '264-8765-4321', 'San Juan', '2018-06-13'),
('Benjamín', 'Ramírez', 'benjamin.ramirez@mail.com', NULL, '379-2345-6789', 'Corrientes', '2021-03-19'),
('Emilia', 'Hernández', 'emilia.hernandez@mail.com', '0388-1234-5678', NULL, 'Jujuy', '2017-12-11'),
('Lautaro', 'Torres', NULL, NULL, NULL, 'Posadas', '2018-07-28'),
('Agustina', 'Ruiz', 'agustina.ruiz@mail.com', '02965-3456-7890', '2965-8765-4321', 'Río Gallegos', '2022-08-06'),
('Valentino', 'Molina', NULL, NULL, '261-3456-7890', 'Mendoza', '2020-09-21'),
('Lola', 'Suárez', 'lola.suarez@mail.com', '0342-8765-4321', NULL, 'Santa Fe', '2019-05-04'),
('Juan', 'Sosa', NULL, NULL, NULL, 'Paraná', '2018-11-16'),
('Manuela', 'García', 'manuela.garcia@mail.com', '0387-4321-8765', NULL, 'Salta', '2021-02-25'),
('Tobías', 'Navarro', 'tobias.navarro@mail.com', NULL, NULL, 'San Luis', '2023-04-09'),
('Isabella', 'Ortiz', NULL, '0298-9876-5432', '298-4321-8765', 'General Roca', '2017-03-14'),
('Francisco', 'Cabrera', 'francisco.cabrera@mail.com', '02920-3456-7890', NULL, 'Comodoro Rivadavia', '2018-01-22'),
('Mía', 'Rojas', NULL, NULL, NULL, 'Trelew', '2019-08-12'),
('Julieta', 'Ibáñez', 'julieta.ibanez@mail.com', NULL, '3822-6543-9876', 'Catamarca', '2022-06-03'),
('Gabriel', 'Ponce', 'gabriel.ponce@mail.com', '0385-2345-6789', NULL, 'Santiago del Estero', '2020-07-25'),
('Elena', 'Aguilar', NULL, NULL, NULL, 'Mar del Plata', '2021-10-31'),
('Nicolás', 'Morales', 'nicolas.morales@mail.com', '03784-1234-5678', '3784-5678-1234', 'Formosa', '2023-02-14'),
('Victoria', 'Vega', NULL, NULL, NULL, 'Salta', '2017-06-18'),
('Simón', 'Castro', 'simon.castro@mail.com', '03863-3456-7890', '3863-8765-4321', 'La Rioja', '2018-09-27'),
('Olivia', 'Alvarez', NULL, NULL, NULL, 'San Miguel de Tucumán', '2020-10-02'),
('Pedro', 'Méndez', 'pedro.mendez@mail.com', NULL, '388-6543-9876', 'San Salvador de Jujuy', '2022-05-15'),
('Mía', 'Díaz', 'mia.diaz@mail.com', '03492-2345-6789', NULL, 'Rafaela', '2021-03-07'),
('David', 'Paz', NULL, NULL, NULL, 'Santiago del Estero', '2019-11-23'),
('Renata', 'Figueroa', 'renata.figueroa@mail.com', '03783-1234-5678', '3783-5678-1234', 'Posadas', '2022-12-28'),
('Sebastián', 'Correa', NULL, NULL, NULL, 'Salta', '2023-06-05'),
('Florencia', 'Gutiérrez', 'florencia.gutierrez@mail.com', '02954-3456-7890', NULL, 'Santa Rosa', '2018-02-18'),
('Emilio', 'Luna', NULL, NULL, '11-4321-7654', 'Buenos Aires', '2020-11-01'),
('Julieta', 'Paz', 'julieta.paz@mail.com', NULL, NULL, 'Salta', '2019-04-21'),
('Gabriela', 'Molina', NULL, NULL, NULL, 'Córdoba', '2023-08-15'),
('Tomás', 'Ibáñez', 'tomas.ibanez@mail.com', '0341-8765-4321', NULL, 'Rosario', '2021-12-02'),
('Bianca', 'Ortiz', NULL, NULL, '351-1234-5678', 'Córdoba', '2017-07-29'),
('Santiago', 'Moreno', 'santiago.moreno@mail.com', NULL, NULL, 'Mendoza', '2022-09-09'),
('Juliana', 'Romero', NULL, NULL, NULL, 'La Plata', '2019-05-19'),
('Lucas', 'Fernández', 'lucas.fernandez@mail.com', '011-4321-7654', NULL, 'Buenos Aires', '2020-03-23'),
('Matías', 'Gómez', NULL, NULL, '11-2345-6789', 'Buenos Aires', '2018-10-08'),
('Camila', 'Ramírez', 'camila.ramirez@mail.com', '0221-4321-8765', NULL, 'La Plata', '2021-01-29'),
('Nicolás', 'López', NULL, NULL, NULL, 'San Juan', '2023-07-13'),
('Elena', 'Martínez', 'elena.martinez@mail.com', NULL, NULL, 'Mar del Plata', '2017-04-06'),
('Martín', 'Gutiérrez', NULL, '0223-3456-7890', NULL, 'Mar del Plata', '2019-12-27');
Go

INSERT INTO Pedidos (IdCliente, FechaPedido, Estado, MontoTotal)
VALUES 
(1, '2023-07-20', 'Pagado', 1500.00),
(2, '2022-05-15', 'Pendiente', 3200.50),
(3, '2021-11-10', 'Rechazado', 450.75),
(4, '2020-03-25', 'Pagado', 780.20),
(5, '2019-12-18', 'En preparación', 1980.90),
(6, '2021-06-05', 'Pagado', 2300.00),
(1, '2022-01-20', 'Pendiente', 5600.30),
(8, '2020-09-10', 'Rechazado', 880.40),
(9, '2018-11-15', 'Pagado', 320.60),
(1, '2023-02-25', 'En preparación', 5600.30),
(1, '2019-04-12', 'Pagado', 1050.00),
(12, '2022-08-30', 'Pendiente', 2100.75),
(13, '2020-10-22', 'Rechazado', 670.80),
(4, '2021-07-19', 'Pagado', 780.15),
(5, '2017-05-25', 'En preparación', 250.00),
(16, '2022-12-14', 'Pendiente', 980.50),
(17, '2019-09-08', 'Pagado', 4100.75),
(8, '2023-03-03', 'Rechazado', 870.90),
(19, '2020-06-12', 'Pagado', 2999.00),
(20, '2018-02-22', 'En preparación', 230.40),
(1, '2021-04-17', 'Pendiente', 520.90),
(22, '2020-07-29', 'Rechazado', 340.00),
(3, '2017-10-05', 'Pagado', 750.00),
(24, '2022-11-21', 'Pendiente', 4100.60),
(25, '2019-03-12', 'Pagado', 899.99),
(6, '2021-01-30', 'Rechazado', 220.80),
(27, '2020-12-10', 'Pagado', 3600.00),
(8, '2023-06-18', 'Pendiente', 450.50),
(29, '2018-08-22', 'Pagado', 720.90),
(10, '2019-07-14', 'En preparación', 540.10),
(1, '2022-02-26', 'Rechazado', 380.00),
(12, '2020-04-05', 'Pagado', 670.50),
(33, '2021-08-09', 'Pendiente', 1900.25),
(4, '2018-10-13', 'Pagado', 3200.40),
(35, '2019-11-28', 'En preparación', 1290.75),
(6, '2023-01-05', 'Pendiente', 470.30),
(37, '2017-06-16', 'Rechazado', 520.80),
(8, '2021-12-23', 'Pagado', 3600.99),
(9, '2020-05-19', 'Pendiente', 780.00),
(1, '2018-09-25', 'Rechazado', 180.50);
*/
/**/

/*1 Todos los clientes indicando Apellido, Nombre y Correo Electrónico.*/
Select * from Clientes

/*Todos los clientes indicando Apellido y Nombre con el formato: [Apellido],
[Nombre] (ordenados por Apellido en forma descendente). Por ejemplo:
Martinez, Sofía*/
Select Apellido + ', ' + Nombre as Clientes
from Clientes
ORDER BY Apellido DESC

/*3 Los clientes cuya ciudad contenga la palabra ‘Jujuy’ (indicando Nombre,
Apellido y Ciudad)*/
select Nombre, Apellido, Ciudad from Clientes
WHERE Ciudad LIKE '%Jujuy%'

/*Los clientes que no tengan registrado su correo electrónico (indicando
IdCliente, Apellido y Nombre). Ordenar por Apellido en forma descendente y
por Nombre en forma ascendente.*/
Select IdCliente, Apellido, Nombre from Clientes
WHERE CorreoElectronico IS NULL
ORDER BY Nombre ASC, Apellido DESC

/*El último cliente del listado en orden alfabético (ordenado por Apellido y luego
por Nombre). Indicar IdCliente, Apellido y Nombre.*/
Select TOP 1 IdCliente, Apellido, Nombre from Clientes
ORDER BY Apellido DESC, Nombre DESC

/*Los clientes cuyo año de alta haya sido 2019 (Indicar Nombre, Apellido y
Fecha de alta).*/
Select Nombre, Apellido, FechaAlta from Clientes
WHERE YEAR(FechaAlta) = 2019

/*Todos los clientes indicando Apellido, Nombre y Datos de Contacto. La última
columna debe contener el mail si el cliente tiene mail, de lo contrario el Celular,
sino el Teléfono y en caso de no tener ninguno debe indicar 'Incontactable'*/
Select Apellido, Nombre,
CASE
WHEN CorreoElectronico IS NOT NULL THEN CorreoElectronico
WHEN Celular IS NOT NULL THEN Celular
WHEN Telefono IS NOT NULL THEN Telefono
Else 'Incontactable'
END AS DatosContacto
from Clientes

/*Todos los clientes, indicando el semestre en el cual se produjo su alta. Indicar
Nombre, Apellido, Fecha de Alta y la frase “Primer Semestre” o “Segundo
Semestre” según corresponda.*/
Select Nombre, Apellido, FechaAlta,
CASE
WHEN MONTH(FechaAlta) > 6 THEN 'Segundo Semestre'
WHEN MONTH(FechaAlta) <= 6 THEN 'Primer Semestre'
END AS Semestre
from Clientes

/*Los clientes que tengan registrado teléfono pero no celular. Indicar IdCliente, 
Apellido y Nombre. Ordenar en forma descendente por fecha de alta*/
Select IdCliente, Apellido, Nombre from Clientes
WHERE Telefono IS NOT NULL
AND Celular IS NULL
ORDER BY FechaAlta DESC

/*Todas las ciudades donde residen los clientes. NOTA: 
no se pueden repetir*/
Select DISTINCT Ciudad from Clientes

/*Todos los pedidos cuyo Estado no sea Rechazado. Indicar IdPedido, IdCliente,
Fecha y Monto Total. Ordenar los resultados por fecha de pedido (del más
reciente al más antigüo).*/
Select IdPedido, IdCliente, FechaPedido, MontoTotal from Pedidos
WHERE Estado != 'Rechazado'
ORDER BY FechaPedido DESC

/*Todos los pedidos cuyo Estado sea “Pagado” o “En preparación” y su monto
esté entre $500 y $1250 (ambos inclusive). Indicar el valor de todas las
columnas.
*/
Select * from Pedidos
WHERE (Estado = 'Pagado' OR Estado = 'En preparación')
AND (MontoTotal >=500 AND MontoTotal <= 1250)

/*Listar los meses del año en los que se registraron pedidos en los años 2018 y
2019. NOTA: no indicar más de una vez el mismo mes.*/
Select DISTINCT MONTH(FechaPedido) AS Meses201819 
FROM Pedidos
WHERE YEAR(FechaPedido) = 2018 OR YEAR(FechaPedido) = 2019

/*Indicar los distintos ID de clientes que realizaron pedidos por un monto total
mayor a $1000 y cuyo estado no sea Rechazado.
*/
Select DISTINCT IdCliente from Pedidos
WHERE (MontoTotal > 1000) AND (Estado != 'Rechazado')

/*Listar todos los datos de los pedidos realizados por los clientes con ID 1, 8,
16, 24, 32 y 48. Los registros deben estar ordenados por IdCliente y Estado.*/
Select * from Pedidos
WHERE IdCliente = 1 OR IdCliente = 8 OR IdCliente = 16 OR IdCliente = 24 OR IdCliente = 32 OR IdCliente = 48
ORDER BY IdCliente ASC, Estado ASC

/*Listar todos los datos de los tres pedidos de más bajo monto que se
encuentren en estado Pagado.
*/
Select TOP 3 * from Pedidos
WHERE Estado = 'Pagado'
ORDER BY MontoTotal ASC

/*Listar los pedidos que tengan estado Rechazado y un monto total menor a
$500 o bien tengan estado En preparación y un monto total que supere los
$1000. Indicar todas las columnas excepto Id de Cliente y Fecha del pedido.
Ordenar por Id de pedido.*/
Select IdPedido, Estado, MontoTotal from Pedidos
WHERE (Estado = 'Rechazado' AND MontoTotal < 500) OR (Estado = 'En preparación' AND MontoTotal > 1000)
ORDER BY IdPedido ASC

/**/

/**/

/**/

/**/

/**/

/**/