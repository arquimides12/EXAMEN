-- Crear base de datos
CREATE DATABASE InvDB;
GO

-- Usar la base de datos
USE InvDB;
GO

-- Crear tabla Categoria
CREATE TABLE Categoria (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(200)
);
GO

-- Crear tabla Producto
CREATE TABLE Producto (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(200),
    Precio DECIMAL(10, 2),
    Stock INT,
    FechaVencimiento DATE,
    Estado BIT, -- 1 = Activo, 0 = Inactivo
    IdCategoria INT FOREIGN KEY REFERENCES Categoria(IdCategoria)
);
GO

-- Verificar que las tablas existan
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categoria';
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Producto';

INSERT INTO Producto (Nombre, Descripcion, Stock, Precio, FechaVencimiento, Estado, IdCategoria)
VALUES ('Producto 1', 'Descripción del producto 1', 50, 100.50, '2025-12-31', 1, 1),
       ('Producto 2', 'Descripción del producto 2', 30, 200.75, '2025-06-30', 1, 2);

INSERT INTO Categoria (Nombre, Descripcion)
VALUES ('Electrónica', 'Productos electrónicos'),
       ('Ropa', 'Prendas de vestir'),
       ('Alimentos', 'Comida y bebidas');

Select *from Producto
