-- Crear base de datos
CREATE DATABASE IF NOT EXISTS CafeDB;
USE CafeDB;

-- Crear tablas 

CREATE TABLE Proveedores (
    Id_proveedor INT,
    Nombre_proveedor VARCHAR(50),
    Email_proveedor VARCHAR(50),
    Telefono_proveedor VARCHAR(20),
    PRIMARY KEY (Id_proveedor)
);

CREATE TABLE Productos (
    Id_producto INT,
    Nombre_producto VARCHAR(50),
    Tipo_producto VARCHAR(50),
    Precio_producto DECIMAL(10, 2),
    Stock_producto INT,
    Id_proveedor INT,
    PRIMARY KEY (Id_producto),
    FOREIGN KEY (Id_proveedor) REFERENCES Proveedores(Id_proveedor)
);


CREATE TABLE Clientes (
    Id_cliente INT,
    Nombre_cliente VARCHAR(50),
    Apellido_cliente VARCHAR(50),
    Email_cliente VARCHAR(50),
    PRIMARY KEY(Id_cliente)
);


CREATE TABLE Pedidos (
    Id_pedido INT,
    Tipo_producto VARCHAR(50),
    Precio_producto DECIMAL(10, 2),
    Fecha_pedido DATE,
    Cantidad_productos INT,
    Id_cliente INT,
    Id_producto INT,
    PRIMARY KEY (Id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


CREATE TABLE Empleados (
    Id_empleado INT ,
    Apellido_empleado VARCHAR(50),
    Nombre_empleado VARCHAR(50),
    Fecha_ingreso_empleado DATE,
    PRIMARY KEY(Id_empleado)
);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha_venta DATE,
    total_venta DECIMAL(10, 2)
);

CREATE TABLE CambiosInventario (
    id_cambio INT PRIMARY KEY AUTO_INCREMENT,
    id_producto INT,
    fecha_cambio DATE,
    cantidad_anterior INT,
    cantidad_nueva INT,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE PagosClientes (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_pago DATE,
    monto_pago DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE CategoriasProductos (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

CREATE TABLE MetodosPago (
    id_metodo_pago INT PRIMARY KEY,
    nombre_metodo VARCHAR(50)
);

CREATE TABLE Proyectos (
    id_proyecto INT PRIMARY KEY,
    nombre_proyecto VARCHAR(50),
    descripcion VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE CategoriasClientes (
    id_categoria_cliente INT PRIMARY KEY,
    nombre_categoria_cliente VARCHAR(50),
    descripcion VARCHAR(100)
);

CREATE TABLE VentasPorMetodoPago (
    id_venta INT PRIMARY KEY,
    id_metodo_pago INT,
    fecha_venta DATE,
    total_venta_metodo_pago DECIMAL(10, 2),
    FOREIGN KEY (id_metodo_pago) REFERENCES MetodosPago(id_metodo_pago)
);

CREATE TABLE VentasPorProducto (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    fecha_venta DATE,
    cantidad_vendida INT,
    total_venta_producto DECIMAL(10, 2),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


-- Cargar datos en las tablas
INSERT INTO Productos (Id_producto, Nombre_producto, Tipo_producto, Precio_producto, Stock_producto, Id_proveedor) VALUES
(1, 'Café Espresso', 'Café', 2.5, 100, 1),
(2, 'Té Verde', 'Té', 1.5, 50, 2);

INSERT INTO Clientes (Id_cliente, Nombre_cliente, Apellido_cliente, Email_cliente) VALUES
(1, 'Juan', 'Pérez', 'juan@example.com'),
(2, 'Ana', 'García', 'ana@example.com');

INSERT INTO Pedidos (Id_pedido, Tipo_producto, Precio_producto, Fecha_pedido, Cantidad_productos, Id_cliente, Id_producto) VALUES
(1, 'Café', 2.5, '2024-01-25', 2, 1, 1),
(2, 'Té', 1.5, '2024-01-26', 3, 2, 2);

INSERT INTO Empleados (Id_empleado, Apellido_empleado, Nombre_empleado, Fecha_ingreso_empleado) VALUES
(1, 'Gómez', 'Carlos', '2020-01-01'),
(2, 'Rodríguez', 'María', '2021-02-15');

INSERT INTO Proveedores (Id_proveedor, Nombre_proveedor, Email_proveedor, Telefono_proveedor) VALUES
(1, 'Proveedor1', 'proveedor1@example.com', '123-456-7890'),
(2, 'Proveedor2', 'proveedor2@example.com', '987-654-3210');

INSERT INTO Ventas (fecha_venta, total_venta) VALUES
('2024-01-25', 20.5),
('2024-01-26', 15.75);

INSERT INTO CambiosInventario (id_producto, fecha_cambio, cantidad_anterior, cantidad_nueva) VALUES
(1, '2024-01-25', 100, 98),
(2, '2024-01-26', 50, 47);

INSERT INTO PagosClientes (id_cliente, fecha_pago, monto_pago) VALUES
(1, '2024-01-25', 10.25),
(2, '2024-01-26', 7.50);

INSERT INTO CategoriasProductos (id_categoria, nombre_categoria) VALUES
(1, 'Café en Grano'),
(2, 'Café Molido'),
(3, 'Té Negro'),
(4, 'Té Verde'),
(5, 'Té de Hierbas'),
(6, 'Accesorios de Café'),
(7, 'Máquinas de Café');

INSERT INTO MetodosPago (id_metodo_pago, nombre_metodo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de Crédito'),
(3, 'Transferencia Bancaria'),
(4, 'PayPal'),
(5, 'Criptomoneda');

INSERT INTO Proyectos (id_proyecto, nombre_proyecto, descripcion, fecha_inicio, fecha_fin) VALUES
(1, 'Desarrollo de Sitio Web', 'Crear un sitio web de comercio electrónico para la venta de productos de café y té.', '2024-01-01', '2024-06-30'),
(2, 'Campaña de Marketing', 'Realizar una campaña publicitaria para promocionar los productos de la empresa en redes sociales y medios digitales.', '2024-03-15', '2024-04-30'),
(3, 'Renovación de Local', 'Realizar renovaciones en el local físico para mejorar la experiencia del cliente.', '2024-02-01', '2024-05-15');

INSERT INTO CategoriasClientes (id_categoria_cliente, nombre_categoria_cliente, descripcion) VALUES
(1, 'Clientes Habituales', 'Clientes que realizan compras frecuentes y tienen membresías o programas de fidelización.'),
(2, 'Clientes Corporativos', 'Empresas o negocios que realizan compras a gran escala para eventos o regalos corporativos.'),
(3, 'Clientes Eventuales', 'Clientes ocasionales que realizan compras esporádicas.');

INSERT INTO VentasPorProducto (id_venta, id_producto, fecha_venta, cantidad_vendida, total_venta_producto) VALUES
(1, 1, '2024-01-01', 2, 5.00),
(2, 2, '2024-01-02', 3, 4.50),
(3, 1, '2024-01-03', 1, 2.50),
(4, 3, '2024-01-03', 2, 6.00);

INSERT INTO VentasPorMetodoPago (id_venta, id_metodo_pago, fecha_venta, total_venta_metodo_pago) VALUES
(1, 1, '2024-01-01', 10.00),
(2, 2, '2024-01-02', 15.00),
(3, 1, '2024-01-03', 7.50),
(4, 3, '2024-01-03', 20.00);
-- Consulta simple con WHERE
SELECT * FROM Productos WHERE Tipo_producto = 'Café';

-- Consulta simple con ORDER BY
SELECT * FROM Productos ORDER BY Precio_producto DESC;

-- Consulta con GROUP BY y JOIN
SELECT P.Nombre_producto, COUNT(D.id_pedido) as Cantidad_pedidos
FROM Productos P
JOIN Pedidos D ON P.id_producto = D.id_producto
GROUP BY P.Nombre_producto;

-- Consulta con UNION
SELECT Nombre_cliente, Email_cliente FROM Clientes
UNION
SELECT nombre_proveedor as Nombre_cliente, email_proveedor as Email_cliente FROM Proveedores;

-- Subconsulta
SELECT * FROM Productos
WHERE id_proveedor IN (SELECT id_proveedor FROM Proveedores WHERE nombre_proveedor = 'Proveedor1');

-- Función para calcular el total de un pedido
DELIMITER $$
CREATE FUNCTION CalcularTotalPedido(pedido_id INT)
RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SELECT SUM(Precio_producto * Cantidad_productos) INTO total FROM Pedidos WHERE id_pedido = pedido_id;
    RETURN total;
END$$
DELIMITER $$

-- Vista para mostrar detalles del pedido con información del producto
CREATE VIEW VistaDetallesPedido AS
SELECT D.id_pedido, P.Nombre_producto, D.Cantidad_productos, D.Precio_producto
FROM Pedidos D
JOIN Productos P ON D.id_producto = P.id_producto;

-- Vista para mostrar clientes con la cantidad de pedidos realizados
CREATE VIEW VistaClientesConPedidos AS
SELECT C.id_cliente, CONCAT(C.Nombre_cliente, ' ', C.Apellido_cliente) as Nombre_completo, COUNT(P.id_pedido) as Cantidad_pedidos
FROM Clientes C
LEFT JOIN Pedidos P ON C.id_cliente = P.id_cliente
GROUP BY C.id_cliente;

-- Borrar un dato de una lista

/*DELETE FROM Productos 
WHERE Id_productos=1;*/


-------------------------- Segunda Entrega ---------------------------------

-- Crear funciones y vistas
DELIMITER $$

-- Función para calcular el total de un pedido
CREATE FUNCTION CalcularTotalPedido(pedido_id INT)
RETURNS DECIMAL
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL;
    SELECT SUM(Precio_producto * Cantidad_productos) INTO total FROM Pedidos WHERE Id_pedido = pedido_id;
    RETURN total;
END$$

-- Función para buscar clientes por nombre o apellido
CREATE FUNCTION BuscarCliente(
    IN nombre_apellido VARCHAR(100)
)
RETURNS TABLE(Id_cliente INT, Nombre_cliente VARCHAR(50), Apellido_cliente VARCHAR(50), Email_cliente VARCHAR(50))
BEGIN
    RETURN (
        SELECT Id_cliente, Nombre_cliente, Apellido_cliente, Email_cliente
        FROM Clientes
        WHERE CONCAT(Nombre_cliente, ' ', Apellido_cliente) LIKE CONCAT('%', nombre_apellido, '%')
    );
END$$


-- Vista para mostrar detalles del pedido con información del producto
CREATE VIEW VistaDetallesPedido AS
SELECT D.Id_pedido, P.Nombre_producto, D.Cantidad_productos, D.Precio_producto
FROM Pedidos D
JOIN Productos P ON D.Id_producto = P.Id_producto;

-- Vista para mostrar clientes con la cantidad de pedidos realizados
CREATE VIEW VistaClientesConPedidos AS
SELECT C.Id_cliente, CONCAT(C.Nombre_cliente, ' ', C.Apellido_cliente) as Nombre_completo, COUNT(P.Id_pedido) as Cantidad_pedidos
FROM Clientes C
LEFT JOIN Pedidos P ON C.Id_cliente = P.Id_cliente
GROUP BY C.Id_cliente$$

-- Vista para mostrar empleados que ingresaron recientemente
CREATE VIEW VistaEmpleadosIngresoReciente AS
SELECT Id_empleado, Apellido_empleado, Nombre_empleado, Fecha_ingreso_empleado
FROM Empleados
ORDER BY Fecha_ingreso_empleado DESC;

-- Vista para mostrar productos agotados en el inventario
CREATE VIEW VistaProductosAgotados AS
SELECT Id_producto, Nombre_producto, Tipo_producto, Precio_producto, Stock_producto
FROM Productos
WHERE Stock_producto = 0;

-- Vista para mostrar detalles completos de todos los pedidos
CREATE VIEW VistaPedidosDetallados AS
SELECT P.Id_pedido, C.Nombre_cliente, C.Apellido_cliente, P.Tipo_producto, P.Precio_producto, P.Fecha_pedido, P.Cantidad_productos
FROM Pedidos P
JOIN Clientes C ON P.Id_cliente = C.Id_cliente;

DELIMITER ;

-- Stored Procedures y Triggers
DELIMITER $$

-- Stored Procedure para registrar un nuevo cliente
CREATE PROCEDURE RegistrarNuevoCliente(
    IN nombre_cliente VARCHAR(50),
    IN apellido_cliente VARCHAR(50),
    IN email_cliente VARCHAR(50)
)
BEGIN
    INSERT INTO Clientes (Nombre_cliente, Apellido_cliente, Email_cliente) VALUES (nombre_cliente, apellido_cliente, email_cliente);
END$$

-- Stored Procedure para actualizar el stock de un producto
CREATE PROCEDURE ActualizarStockProducto(
    IN producto_id INT,
    IN nueva_cantidad INT
)
BEGIN
    UPDATE Productos
    SET Stock_producto = nueva_cantidad
    WHERE Id_producto = producto_id;
END$$

-- Trigger para actualizar el stock después de un pedido
CREATE TRIGGER ActualizarStockDespuesDePedido
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET Stock_producto = Stock_producto - NEW.Cantidad_productos
    WHERE Id_producto = NEW.Id_producto;
END$$

DELIMITER ;

