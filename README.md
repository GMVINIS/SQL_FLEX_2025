# SQL_FLEX_2025

<h1 align="center">SQL</h1>

<p align="center"> 
    <img src="https://jobs.coderhouse.com/assets/logos_coderhouse.png" alt="CoderHouse"  height="100"/>
</p>

---

<br>

<p align="center"> 
<img src="https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/SQL_2019_Webpage_illustration_RE4r3wO:VP1-539x400?resMode=sharp2&op_usm=1.5,0.65,15,0&qlt=100&fit=constrain" alt="SQL" />

<br>

---

## Introducción:

```sh
Como parte de la evolución de GV Indumentaria, surgió la necesidad de desarrollar un modelo dinámico capaz de responder de manera eficiente a las actividades diarias de la empresa.
Contar con información organizada y de rápida consulta es clave para optimizar las ganancias y facilitar la toma de decisiones.
En este proyecto se detallan los conceptos, criterios de diseño y decisiones técnicas que guiaron la creación de la base de datos, con el objetivo de mejorar la gestión y el acceso a la información.

```
## Objetivos:

```sh
El objetivo principal de esta base de datos es estructurar de forma organizada y eficiente la información relacionada con el proceso de venta de indumentaria de GV Indumentaria.
Permite gestionar de manera precisa el stock de productos, los costos y precios de venta, así como la información de cada transacción, con el fin de establecer parámetros de compra, definir márgenes y optimizar las ventas.

```

## Situación Problematica:

```sh
En el marco de su crecimiento, GV Indumentaria se enfrenta a la necesidad de optimizar la gestión de su información para responder de forma ágil y precisa a las demandas diarias del negocio.
La empresa carece de un sistema centralizado que organice y relacione datos clave como stock, costos, precios de venta y registros de transacciones. Esta dispersión de información dificulta la consulta rápida, retrasa la toma de decisiones y puede impactar negativamente en los márgenes de ganancia.
Contar con una base de datos sólida y bien estructurada se vuelve esencial para establecer parámetros de compra, definir márgenes óptimos y maximizar la eficiencia en el proceso de ventas.

```

## Modelo de negocio:

```sh
GV Indumentaria se dedica a la comercialización de prendas de vestir, enfocándose en la compra de productos terminados para su posterior venta.
Su propuesta de valor se basa en ofrecer al cliente una variedad de prendas adaptadas a diferentes temporadas, estilos y talles, manteniendo un equilibrio entre calidad, tendencia y precio competitivo.
El negocio genera ingresos principalmente a través de Ventas minoristas a clientes finales.
Su rentabilidad depende de la gestión eficiente del stock, el control de costos y márgenes, y la rotación de inventario para adaptarse a la demanda del mercado y las tendencias de moda.

```

### Descripción de la Base de Datos

<br>

```sh
Tabla: tipo_prenda
Clave primaria: id_tipo_prenda
Claves foráneas: ninguna
Descripción: Identifica de manera única cada tipo de prenda ( Superiores, Inferiores, Accesorios, etc), garantizando la unicidad de los registros y facilitando la clasificación de los productos.

Tabla: temporada
Clave primaria: id_temporada
Claves foráneas: ninguna
Descripción: Diferencia de forma única cada temporada ( Primavera/verano, Otoño/Invierno), permitiendo organizar los productos según la época del año.

Tabla: color
Clave primaria: id_color
Claves foráneas: ninguna
Descripción: Permite asignar un color específico a los productos de forma única, facilitando la referencia en inventario, ventas y reportes.

Tabla: talle
Clave primaria: id_talle
Claves foráneas: ninguna
Descripción: Distingue cada talla (S, M, L, XL, etc.) de manera única, asegurando que los productos puedan ser identificados correctamente según su tamaño.

Tabla: producto
Clave primaria: id_producto
Claves foráneas:
id_tipo_prenda → tipo_prenda(id_tipo_prenda)
id_temporada → temporada(id_temporada)
Descripción: Registra cada producto del catálogo de forma única con su nombre, tipo de prenda y temporada. Las claves foráneas aseguran que cada producto esté correctamente clasificado según su tipo y temporada.

Tabla: cliente
Clave primaria: id_cliente
Claves foráneas: ninguna
Descripción: Diferencia cada cliente de forma única y almacena su información personal y de contacto, asegurando que el historial de compras se vincule correctamente a la persona.

Tabla: precio_producto
Clave primaria: id_precio
Claves foráneas:
id_producto → producto(id_producto)
Descripción: Guarda los distintos precios históricos de cada producto, incluyendo la moneda. La relación con la tabla producto asegura que cada precio corresponda a un producto válido.

Tabla: costo_producto
Clave primaria: id_costo
Claves foráneas:
id_producto → producto(id_producto)
Descripción: Registra los costos de adquisición de cada producto a lo largo del tiempo, permitiendo calcular márgenes y rentabilidad.

Tabla: venta
Clave primaria: id_venta
Claves foráneas:
id_cliente → cliente(id_cliente)
Descripción: Identifica cada venta de manera única, registrando la fecha y el cliente asociado. Facilita el seguimiento de transacciones y la gestión de historial de compras.

Tabla: detalle_venta
Clave primaria: id_detalle
Claves foráneas:
id_venta → venta(id_venta)
id_producto → producto(id_producto)
id_talle → talle(id_talle)
id_color → color(id_color)
Descripción: Registra cada línea de productos dentro de una venta, incluyendo la cantidad, talle y color del producto. Las claves foráneas vinculan cada detalle con la venta correspondiente y con los atributos del producto vendido.

Tabla: stock
Clave primaria: id_stock
Claves foráneas:
id_producto → producto(id_producto)
id_talle → talle(id_talle)
id_color → color(id_color)
Descripción: Mantiene la cantidad disponible de cada producto según su talla y color, permitiendo controlar el inventario y validar la disponibilidad antes de generar ventas.

Tabla: log_cliente
Clave primaria: id
Claves foráneas: ninguna
Descripción: Registra las acciones realizadas sobre los clientes, incluyendo el usuario que realizó la operación, la fecha, la hora y una descripción de la acción. Permite auditar cambios, eliminaciones o actualizaciones en la información de los clientes, asegurando trazabilidad y control sobre las modificaciones.

```
### Listado de las vistas

```sh
Vista: vista_producto
Objetivo: El objetivo de esta vista es centralizar en una sola consulta los datos principales de cada producto para simplificar reportes, búsquedas y listados de inventario.
Tablas que la componen:
    Tabla producto: Contiene la información básica de los productos, como ID y nombre.
    Tabla color: Aporta la descripción del color de cada producto.
    Tabla talle: Permite obtener la descripción del talle asociado al producto.
    Tabla temporada: Indica la temporada a la que corresponde el producto.
    Tabla tipo_prenda: Define el tipo de prenda (ejemplo: remera, pantalón, campera).
Columnas principales de la vista:
    id_producto: Identificador único del producto.
    nombre_producto: Nombre del producto.
    descripcion_color: Color del producto.
    descripcion_talle: Talle del producto.
    descripcion_temporada: Temporada a la que pertenece el producto.
    descripcion_tipo_prenda: Tipo de prenda del producto.

Vista: bajo_stock
Objetivo: El objetivo de esta vista es identificar rápidamente los productos con bajo stock para tomar decisiones de reposición o ajuste en las ventas.
Tablas que la componen:
    Tabla producto: Proporciona la información necesaria del producto, incluyendo el identificador, nombre y cantidad en stock.
Columnas principales de la vista:
    id_producto: Identificador único del producto.
    nombre_producto: Nombre del producto.
    stock: Cantidad disponible actualmente en inventario.

Vista: stock_valorizado
Objetivo:El objetivo de esta vista es calcular de manera rápida la valorización del stock disponible, lo que permite tener una visión clara del capital invertido en inventario.
Tablas que la componen:
    Tabla producto: Proporciona el identificador, nombre y cantidad en stock de cada producto.
    Tabla cost_producto: Contiene el costo unitario asociado a cada producto.
Columnas principales de la vista:
    id_producto: Identificador único del producto.
    nombre_producto: Nombre del producto.
    stock: Cantidad disponible actualmente en inventario.
    costo: Costo unitario del producto.
    total: Valor total del stock (stock × costo).

Vista: venta_analisis
Objetivo:El objetivo de esta vista es facilitar el análisis de la rentabilidad de las ventas, permitiendo calcular de forma directa los márgenes por producto y por cliente.
Tablas que la componen:
    Tabla venta: Proporciona los datos principales de la venta, como el ID de la venta, cliente y fecha.
    Tabla detalle_venta: Permite acceder al detalle de cada venta (productos vendidos y cantidades).
    Tabla cliente: Aporta la información del cliente (nombre y apellido).
    Tabla precio_producto: Contiene el precio de venta de cada producto.
    Tabla producto: Permite identificar el nombre de los productos vendidos.
    Tabla cost_producto: Aporta el costo de cada producto para calcular el margen.
Columnas principales de la vista:
    id_venta: Identificador único de la venta.
    id_cliente: Identificador del cliente que realizó la compra.
    nombre: Nombre completo del cliente (concatenación de nombre y apellido).
    fecha: Fecha en la que se realizó la venta.
    cantidad: Cantidad de productos vendidos.
    id_producto: Identificador del producto vendido.
    nombre_producto: Nombre del producto.
    precio: Precio de venta unitario del producto.
    costo: Costo unitario del producto.
    margen_total: Margen obtenido en la venta, calculado como (cantidad × (precio - costo)).

Vista: venta_internacional
Objetivo:El objetivo de esta vista es analizar el comportamiento de ventas según la nacionalidad de los clientes, identificando mercados más activos o con mayor volumen de compras.
Tablas que la componen:
    Tabla cliente: Proporciona la nacionalidad de los clientes que realizaron compras.
    Tabla venta: Aporta la información de las ventas, permitiendo contabilizarlas por cliente.
Columnas principales de la vista:
    nacionalidad: Nacionalidad del cliente.
    ventas: Cantidad total de ventas realizadas por clientes de esa nacionalidad.

Vista: variedad_productos
Objetivo:El objetivo de esta vista es analizar la variedad de productos que ofrece la empresa, permitiendo identificar combinaciones de tipo de prenda y talle que cuentan con mayor o menor cantidad de stock.
Tablas que la componen:
    Tabla producto: Contiene la información base de cada producto.
    Tabla tipo_prenda: Aporta la descripción del tipo de prenda (remera, pantalón, campera, etc.).
    Tabla talle: Proporciona la descripción de los talles disponibles.
Columnas principales de la vista:
    descripcion_tipo_prenda: Tipo de prenda.
    descripcion_talle: Talle del producto.
    cantidad: Número total de productos para esa combinación de prenda y talle.

Vista: detalle_venta_check
Objetivo:El objetivo de esta vista es identificar ventas incompletas o inconsistentes para poder corregirlas o completarlas antes de generar reportes o análisis financieros.
Tablas que la componen:
    Tabla venta: Contiene la información principal de las ventas, incluyendo ID de venta, cliente y fecha.
    Tabla detalle_venta: Aporta los detalles de los productos vendidos; se utiliza aquí para detectar ventas sin detalle asociado.
Columnas principales de la vista:
    id_venta: Identificador único de la venta.
    id_cliente: Identificador del cliente que realizó la venta.
    fecha: Fecha en la que se realizó la venta.
    id_detalle: Identificador del detalle de venta (en esta vista será NULL para ventas sin detalle).
```
### Listado de las funciones

```sh

Función: buscar_stock_por_producto
Descripción: Esta función recibe como parámetro el ID de un producto y devuelve la cantidad de stock disponible de ese producto en la tabla producto.
Objetivo: Facilitar la consulta del stock de un producto específico, permitiendo controlar inventarios y validar disponibilidad antes de realizar operaciones como ventas o reservas

Función: compras_cliente
Descripción: Esta función recibe como parámetro el ID de un cliente y devuelve la cantidad total de compras (ventas) realizadas por ese cliente registradas en la tabla venta.
Objetivo: Facilitar el seguimiento del historial de compras de cada cliente, permitiendo análisis de comportamiento, fidelización o generación de reportes de ventas por cliente.
```
### Listado de los store procedures

```sh
Stored Procedure: sp_ventasproducto
Descripción: Este procedimiento recibe como parámetro el ID de un producto y devuelve un listado de todas las ventas en las que ese producto ha sido vendido, incluyendo el nombre del producto, el ID de la venta, la fecha y la cantidad vendida en cada detalle de venta.
Objetivo: Facilitar la consulta del historial de ventas de un producto específico, permitiendo analizar su desempeño, controlar inventario y generar reportes de ventas detallados.

Stored Procedure: sp_InsertarEliminarclientes
Descripción: Este procedimiento permite insertar un nuevo cliente o eliminar un cliente existente según el valor del parámetro p_operacion.
    Si p_operacion = 'INSERT', inserta un nuevo cliente en la tabla cliente con los datos proporcionados (DNI, nombre, apellido, nacionalidad, email y fecha de nacimiento).
    Si p_operacion = 'DELETE', elimina el cliente cuyo DNI coincida con el proporcionado.
Objetivo: Centralizar y simplificar las operaciones de alta y baja de clientes en la base de datos, asegurando que estas acciones se realicen de manera controlada y consistente.

```
### Listado de los triggers
```sh
Trigger: tr_after_cliente_new
Descripción: Este trigger se ejecuta automáticamente después de insertar un nuevo registro en la tabla cliente. Registra en la tabla log_cliente el usuario que realizó la acción, la fecha, la hora y un mensaje indicando que se ha ingresado un nuevo cliente con su ID correspondiente.
Objetivo: Mantener un historial automático de auditoría sobre la creación de clientes, permitiendo rastrear quién y cuándo se realizaron inserciones en la tabla cliente.

Trigger: tr_after_cliente_delete
Descripción: Este trigger se ejecuta automáticamente después de eliminar un registro de la tabla cliente. Registra en la tabla log_cliente el usuario que realizó la acción, la fecha, la hora y un mensaje indicando que se ha eliminado un cliente con su ID correspondiente.
Objetivo: Mantener un historial automático de auditoría sobre la eliminación de clientes, permitiendo rastrear quién y cuándo se realizaron borrados en la tabla cliente.

Trigger: tr_before_detalle_venta_insert
Descripción: Este trigger se ejecuta automáticamente antes de insertar un registro en la tabla detalle_venta.
Verifica el stock disponible del producto que se intenta vender.
Si el stock es insuficiente, genera un error (SIGNAL) impidiendo la inserción de la venta.
Si hay stock suficiente,descuenta automáticamente la cantidad vendida del stock del producto.
Objetivo: Garantizar que no se puedan registrar ventas con cantidades superiores al stock disponible, manteniendo la integridad del inventario y evitando errores en la gestión de productos.

```

### Scripts de la Base de Datos (Click en los siguientes enlaces):

<br>

- <a href="./base_datos.sql"> Creacion de la Base de Datos </a><br>
- <a href="./ER_Diagrama.pdf"> Diagrama Entidad-Relacion </a><br>
- <a href="./Insercion_Datos.sql"> Inserción de Datos </a><br>
- <a href="./vistas.sql"> Vistas </a><br>
- <a href="./funciones.sql"> Funciones </a><br>
- <a href="./store_procedures.sql"> Store Procedures </a><br>
- <a href="./triggers.sql"> Triggers </a><br>

---

<br>

## Autor: German M Vinisky

### Comisión #81830 - CoderHouse



