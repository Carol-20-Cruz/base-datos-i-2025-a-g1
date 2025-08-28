🧍 PERSONA
id (PK)
nombre
apellido
fecha_nacimiento
correo
direccion
telefono

🧾 CLIENTE
id (PK)
codigo
fecha_vinculacion
persona_id (FK → persona.id)

👨‍💼 EMPLEADO
id (PK)
codigo
fecha_vinculacion
salario
tipo_contrato
persona_id (FK → persona.id)

🏷️ CATEGORIA
id (PK)
nombre
descripcion

💳 METODO_PAGO
id (PK)
nombre
descripcion

📦 PRODUCTO
id (PK)
codigo
nombre
descripcion
categoria_id (FK → categoria.id)

🏪 INVENTARIO
id (PK)
nombre
fecha
precio
stock
fecha_lote
fecha_vencimiento
producto_id (FK → producto.id)

🧾 FACTURA
id (PK)
codigo
fecha
valor_bruto
valor_descuento
valor_incremento
valor_neto
cliente_id (FK → cliente.id)
medio_pago_id (FK → metodo_pago.id)

📑 DETALLE_FACTURA
id (PK)
cantidad
porcentaje_descuento
porcentaje_incremento
subtotal
producto_id (FK → producto.id)
factura_id (FK → factura.id)













