-- ==== INSERT PERSONAS ====
INSERT INTO persona (nombre, apellido, fecha_nacimiento, correo, direccion, telefono) VALUES
('Laura', 'Gómez', '1995-03-10', 'laura@gmail.com', 'Calle 123', '3214567890'),
('Carlos', 'Ruiz', '1990-07-21', 'carlos@gmail.com', 'Av. 45', '3115678890'),
('María', 'Torres', '1988-09-10', 'maria@gmail.com', 'Cra. 8 #12-45', '3009991122'),
('Andrés', 'Mejía', '1993-11-25', 'andres@gmail.com', 'Calle 60', '3208899900'),
('Ana', 'Martínez', '1985-05-05', 'ana@gmail.com', 'Carrera 30', '3005557777');

-- ==== INSERT CLIENTES ====
INSERT INTO cliente (codigo, fecha_vinculacion, persona_id) VALUES
('CLI001', '2023-01-10', 1),
('CLI002', '2022-11-15', 2),
('CLI003', '2024-03-01', 3);

-- ==== INSERT EMPLEADOS ====
INSERT INTO empleado (codigo, fecha_vinculacion, salario, tipo_contrato, persona_id) VALUES
('EMP001', '2022-05-10', 3500000, 'fijo', 4),
('EMP002', '2023-08-01', 2500000, 'temporal', 5);

-- ==== INSERT CATEGORIAS ====
INSERT INTO categoria (nombre, descripcion) VALUES
('Electrónica', 'Productos electrónicos'),
('Hogar', 'Productos para el hogar'),
('Ropa', 'Prendas de vestir');

-- ==== INSERT MÉTODOS DE PAGO ====
INSERT INTO metodo_pago (nombre, descripcion) VALUES
('Efectivo', 'Pago en efectivo'),
('Tarjeta Crédito', 'Pago con tarjeta de crédito'),
('Transferencia', 'Transferencia bancaria');

-- ==== INSERT PRODUCTOS ====
INSERT INTO producto (codigo, nombre, descripcion, categoria_id) VALUES
('P001', 'Televisor 55"', 'Smart TV 4K', 1),
('P002', 'Lavadora', 'Automática de 15kg', 2),
('P003', 'Camisa', 'Camisa formal hombre', 3),
('P004', 'Celular', 'Smartphone gama media', 1),
('P005', 'Sofá', 'Sofá 3 puestos', 2);

-- ==== INSERT INVENTARIO ====
INSERT INTO inventario (nombre, fecha, precio, stock, fecha_lote, fecha_vencimiento, producto_id) VALUES
('Stock1', '2024-01-01', 2500000, 10, '2024-01-01', '2026-01-01', 1),
('Stock2', '2024-02-01', 1800000, 15, '2024-02-01', '2025-12-31', 2),
('Stock3', '2024-01-15', 100000, 50, '2024-01-10', '2025-01-10', 3),
('Stock4', '2024-03-01', 950000, 30, '2024-02-20', '2025-03-01', 4),
('Stock5', '2024-03-10', 1200000, 5, '2024-03-10', '2026-03-10', 5);

-- ==== INSERT FACTURAS ====
INSERT INTO factura (codigo, fecha, valor_bruto, valor_descuento, valor_incremento, valor_neto, cliente_id, medio_pago_id) VALUES
('F001', '2024-03-15', 3000000, 100000, 50000, 2950000, 1, 1),
('F002', '2024-03-16', 1800000, 0, 0, 1800000, 2, 2),
('F003', '2024-03-17', 2000000, 200000, 0, 1800000, 3, 3);

-- ==== INSERT DETALLE FACTURA ====
INSERT INTO detalle_factura (cantidad, porcentaje_descuento, porcentaje_incremento, subtotal, producto_id, factura_id) VALUES
(1, 5.00, 0.00, 2375000, 1, 1),
(2, 0.00, 0.00, 2000000, 2, 2),
(3, 10.00, 0.00, 270000, 3, 3);

-- ==== UPDATEs (10 ejemplos) ====
UPDATE persona SET correo = 'laura.gomez@gmail.com' WHERE id = 1;
UPDATE empleado SET salario = 3700000 WHERE id = 1;
UPDATE producto SET descripcion = 'Televisor Smart TV 4K UHD' WHERE id = 1;
UPDATE categoria SET descripcion = 'Electrodomésticos y electrónicos' WHERE id = 1;
UPDATE cliente SET fecha_vinculacion = '2023-02-01' WHERE id = 1;
UPDATE factura SET valor_descuento = 150000 WHERE id = 1;
UPDATE inventario SET stock = 12 WHERE id = 1;
UPDATE metodo_pago SET nombre = 'Pago en efectivo' WHERE id = 1;
UPDATE producto SET nombre = 'Celular Samsung' WHERE id = 4;
UPDATE detalle_factura SET porcentaje_incremento = 2.5 WHERE id = 1;

-- ==== DELETEs (10 ejemplos) ====
DELETE FROM detalle_factura WHERE id = 3;
DELETE FROM factura WHERE id = 3;
DELETE FROM inventario WHERE id = 5;
DELETE FROM producto WHERE id = 5;
DELETE FROM cliente WHERE id = 3;
DELETE FROM empleado WHERE id = 2;
DELETE FROM metodo_pago WHERE id = 3;
DELETE FROM categoria WHERE id = 3;
DELETE FROM persona WHERE id = 5;
DELETE FROM detalle_factura WHERE id = 2;

-- ==== SELECTs simples ====
SELECT * FROM persona;
SELECT nombre, salario FROM empleado;
SELECT nombre, precio FROM inventario;
SELECT nombre, descripcion FROM producto;
SELECT fecha, valor_neto FROM factura;