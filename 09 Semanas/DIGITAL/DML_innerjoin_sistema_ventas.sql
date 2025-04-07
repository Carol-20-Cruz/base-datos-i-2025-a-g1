--1. Obtener el nombre del cliente y los datos de la factura
SELECT p.nombre, p.apellido, f.codigo, f.fecha, f.valor_neto
FROM factura f
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona p ON c.persona_id = p.id;

-- 2. Listar productos vendidos en facturas, mostrando el nombre del producto y cantidad vendida
SELECT pr.nombre AS producto, df.cantidad
FROM detalle_factura df
INNER JOIN producto pr ON df.producto_id = pr.id;

-- 3. Mostrar el nombre del empleado y su tipo de contrato
SELECT p.nombre, p.apellido, e.tipo_contrato
FROM empleado e
INNER JOIN persona p ON e.persona_id = p.id;

-- 4. Mostrar los productos junto con su categoría
SELECT pr.nombre AS producto, c.nombre AS categoria
FROM producto pr
INNER JOIN categoria c ON pr.categoria_id = c.id;

-- 5. Mostrar productos junto a su inventario (stock y precio)
SELECT pr.nombre, i.stock, i.precio
FROM inventario i
INNER JOIN producto pr ON i.producto_id = pr.id;

-- 6. Mostrar detalles de facturas junto a la factura principal (subtotal y valor neto)
SELECT f.codigo AS factura, df.subtotal, f.valor_neto
FROM detalle_factura df
INNER JOIN factura f ON df.factura_id = f.id;

-- 7. Mostrar facturas con nombre del cliente y método de pago
SELECT f.codigo, p.nombre AS cliente, mp.nombre AS metodo_pago
FROM factura f
INNER JOIN cliente c ON f.cliente_id = c.id
INNER JOIN persona p ON c.persona_id = p.id
INNER JOIN metodo_pago mp ON f.medio_pago_id = mp.id;

-- 8. Mostrar empleados con fecha de vinculación y correo
SELECT p.nombre, p.apellido, e.fecha_vinculacion, p.correo
FROM empleado e
INNER JOIN persona p ON e.persona_id = p.id;

-- 9. Mostrar productos, su categoría y su inventario
SELECT pr.nombre AS producto, c.nombre AS categoria, i.stock, i.precio
FROM producto pr
INNER JOIN categoria c ON pr.categoria_id = c.id
INNER JOIN inventario i ON pr.id = i.producto_id;

--10. Mostrar cantidad de productos por factura
SELECT f.codigo, COUNT(df.producto_id) AS productos_vendidos
FROM factura f
INNER JOIN detalle_factura df ON f.id = df.factura_id
GROUP BY f.codigo;