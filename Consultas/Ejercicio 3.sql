/*
create database Libreria
go
use Libreria
go
create table Autores(
	ID tinyint primary key not null identity (1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Pais varchar(50)
)
create table Libros(
	ID tinyint primary key not null identity (1, 1),
	FechaPublicacion date not null,
	Titulo varchar(50) not null,
	IDAutor tinyint foreign key references Autores(ID)
)
create table Clientes(
	ID tinyint primary key not null identity (1, 1),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Mail varchar(50) unique
)
create table Ventas(
	ID tinyint primary key not null identity (1, 1),
	IDCliente tinyint not null foreign key references Clientes(ID),
	IDLibro tinyint not null foreign key references Libros(ID),
	Fecha date not null check (Fecha <= getdate()),
	Puntaje tinyint null,
	Importe money not null check (Importe > 0)
)
----------------------------------------------------------------------------

INSERT INTO Autores (Nombre, Apellido, Pais) VALUES
('Gabriel', 'García Márquez', 'Colombia'),
('Julio', 'Cortázar', 'Argentina'),
('Jorge Luis', 'Borges', 'Argentina'),
('Isabel', 'Allende', 'Chile'),
('Mario', 'Vargas Llosa', 'Perú'),
('Ernest', 'Hemingway', 'Estados Unidos'),
('George', 'Orwell', 'Reino Unido'),
('Jane', 'Austen', 'Reino Unido'),
('Stephen', 'King', 'Estados Unidos'),
('J. K.', 'Rowling', 'Reino Unido'),
('Haruki', 'Murakami', 'Japón'),
('Paulo', 'Coelho', 'Brasil'),
('Miguel', 'de Cervantes', 'España'),
('Fiódor', 'Dostoyevski', 'Rusia'),
('Agatha', 'Christie', 'Reino Unido');
GO

INSERT INTO Clientes (Nombre, Apellido, Mail) VALUES
('Juan', 'Pérez', 'juan.perez@gmail.com'),
('María', 'Gómez', 'maria.gomez@gmail.com'),
('Lucas', 'Fernández', 'lucas.fernandez@gmail.com'),
('Sofía', 'Martínez', 'sofia.martinez@gmail.com'),
('Nicolás', 'Rodríguez', 'nicolas.rodriguez@gmail.com'),
('Camila', 'López', 'camila.lopez@gmail.com'),
('Mateo', 'Sánchez', 'mateo.sanchez@gmail.com'),
('Valentina', 'Romero', 'valentina.romero@gmail.com'),
('Santiago', 'Torres', 'santiago.torres@gmail.com'),
('Lucía', 'Díaz', 'lucia.diaz@gmail.com'),
('Tomás', 'Álvarez', 'tomas.alvarez@gmail.com'),
('Martina', 'Ruiz', 'martina.ruiz@gmail.com'),
('Agustín', 'Moreno', 'agustin.moreno@gmail.com'),
('Carolina', 'Castro', 'carolina.castro@gmail.com'),
('Federico', 'Ortiz', 'federico.ortiz@gmail.com');
GO

INSERT INTO Libros (FechaPublicacion, Titulo, IDAutor) VALUES
('1951-06-01', 'El coronel no tiene quien le escriba', 1),
('1968-01-01', 'El libro de Manuel', 2),
('1949-01-01', 'El Aleph', 3),
('1985-01-01', 'De amor y de sombra', 4),
('1981-01-01', 'La guerra del fin del mundo', 5),
('1929-05-01', 'Adiós a las armas', 6),
('1949-06-08', '1984', 7),
('1815-12-01', 'Emma', 8),
('1977-11-01', 'El resplandor', 9),
('1998-07-02', 'Harry Potter y la cámara secreta', 10),
('2005-05-10', 'After Dark', 11),
('1994-01-01', 'Veronika decide morir', 12),
('1615-11-01', 'Don Quijote de la Mancha II', 13),
('1867-01-01', 'El jugador', 14),
('1937-01-01', 'Muerte en el Nilo', 15),
('1961-01-01', 'El otoño del patriarca', 1),
('1956-01-01', 'Final del juego', 2),
('1970-01-01', 'El informe de Brodie', 3),
('1991-01-01', 'El plan infinito', 4),
('1977-01-01', 'Pantaleón y las visitadoras', 5),
('1950-09-01', 'Al otro lado del río y entre los árboles', 6),
('1933-01-01', 'La hija del reverendo', 7),
('1818-01-01', 'La abadía de Northanger', 8),
('1987-01-01', 'Misery', 9),
('1999-07-08', 'Harry Potter y el prisionero de Azkaban', 10),
('2009-05-28', '1Q84', 11),
('2003-01-01', 'Once minutos', 12),
('1613-01-01', 'Novelas ejemplares', 13),
('1864-01-01', 'Memorias del subsuelo', 14),
('1939-01-01', 'Diez negritos', 15);
GO

INSERT INTO Ventas (IDCliente, IDLibro, Fecha, Puntaje, Importe) VALUES
(1, 1, '2025-09-15', 5, 18500),
(2, 2, '2025-09-20', 4, 17500),
(3, 3, '2025-09-25', 5, 20000),
(4, 4, '2025-10-02', 4, 21500),
(5, 5, '2025-10-10', 3, 19500),
(6, 6, '2025-10-18', 5, 18000),
(7, 7, '2025-10-25', 4, 16500),
(8, 8, '2025-11-03', 5, 15500),
(9, 9, '2025-11-12', 4, 24000),
(10, 10, '2025-11-20', 5, 22000),
(11, 11, '2025-12-01', 4, 25000),
(12, 12, '2025-12-10', 3, 14500),
(13, 13, '2025-12-18', 5, 27000),
(14, 14, '2025-12-22', 4, 18500),
(15, 15, '2025-12-28', NULL, 23000),
(1, 16, '2026-01-05', 5, 19000),
(2, 17, '2026-01-12', 4, 17500),
(3, 18, '2026-01-20', 5, 21000),
(4, 19, '2026-01-28', 4, 16000),
(5, 20, '2026-02-05', 3, 20000),
(6, 21, '2026-02-14', 5, 18500),
(7, 22, '2026-02-20', 4, 17000),
(8, 23, '2026-03-01', 5, 16000),
(9, 24, '2026-03-10', 4, 24500),
(10, 25, '2026-03-18', 5, 22500),
(11, 26, '2026-04-02', 4, 25500),
(12, 27, '2026-04-15', 3, 15000),
(13, 28, '2026-05-01', 5, 28000),
(14, 29, '2026-05-18', 4, 19500),
(15, 30, '2026-06-01', 5, 23500);
GO
*/

SELECT * from Libros
