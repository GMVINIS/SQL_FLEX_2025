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
"Como parte de la evolución de GV Indumentaria, surgió la necesidad de desarrollar un modelo dinámico capaz de responder de manera eficiente a las actividades diarias de la empresa.
Contar con información organizada y de rápida consulta es clave para optimizar las ganancias y facilitar la toma de decisiones.
En este proyecto se detallan los conceptos, criterios de diseño y decisiones técnicas que guiaron la creación de la base de datos, con el objetivo de mejorar la gestión y el acceso a la información."

```
## Objetivos:

```sh
"El objetivo principal de esta base de datos es estructurar de forma organizada y eficiente la información relacionada con el proceso de venta de indumentaria de GV Indumentaria.
Permite gestionar de manera precisa el stock de productos, los costos y precios de venta, así como la información de cada transacción, con el fin de establecer parámetros de compra, definir márgenes y optimizar las ventas."

```

## Situación Problematica:

```sh
"En el marco de su crecimiento, GV Indumentaria se enfrenta a la necesidad de optimizar la gestión de su información para responder de forma ágil y precisa a las demandas diarias del negocio.
La empresa carece de un sistema centralizado que organice y relacione datos clave como stock, costos, precios de venta y registros de transacciones. Esta dispersión de información dificulta la consulta rápida, retrasa la toma de decisiones y puede impactar negativamente en los márgenes de ganancia.
Contar con una base de datos sólida y bien estructurada se vuelve esencial para establecer parámetros de compra, definir márgenes óptimos y maximizar la eficiencia en el proceso de ventas."

```

## Modelo de negocio:

```sh
"GV Indumentaria se dedica a la comercialización de prendas de vestir, enfocándose en la compra de productos terminados para su posterior venta.
Su propuesta de valor se basa en ofrecer al cliente una variedad de prendas adaptadas a diferentes temporadas, estilos y talles, manteniendo un equilibrio entre calidad, tendencia y precio competitivo.
El negocio genera ingresos principalmente a través de Ventas minoristas a clientes finales.
Su rentabilidad depende de la gestión eficiente del stock, el control de costos y márgenes, y la rotación de inventario para adaptarse a la demanda del mercado y las tendencias de moda."

```

### Descripcion de la Base de Datos

<br>

```sh
Tabla: tipo_prenda
Clave primaria: id_tipo_prenda (identificador único del tipo de prenda).
No tiene claves foráneas.
La clave primaria id_tipo_prenda se seleccionó para identificar de forma única cada tipo de prenda (camisa, pantalón, vestido, etc.), garantizando la unicidad de cada registro.

Tabla: temporada
Clave primaria: id_temporada (identificador único de la temporada).
No tiene claves foráneas.
La clave primaria id_temporada permite diferenciar cada temporada (verano, invierno, etc.) de forma única, evitando confusiones entre registros.

Tabla: color
Clave primaria: id_color (identificador único del color).
No tiene claves foráneas.
La clave primaria id_color permite asignar un color específico a los productos de forma unívoca, facilitando su referencia en otras tablas.

Tabla: talle
Clave primaria: id_talle (identificador único del talle).
No tiene claves foráneas.
La clave primaria id_talle se usa para distinguir cada talla (S, M, L, etc.) de manera única.

Tabla: producto
Clave primaria: id_producto (identificador único del producto).
Claves foráneas:
id_tipo_prenda → tipo_prenda(id_tipo_prenda)
id_temporada → temporada(id_temporada)
id_color → color(id_color)
id_talle → talle(id_talle)
La clave primaria id_producto identifica de forma única cada producto del catálogo. Las claves foráneas aseguran que el producto esté correctamente clasificado por tipo, temporada, color y talle.

Tabla: cliente
Clave primaria: id_cliente (identificador único del cliente).
No tiene claves foráneas.
La clave primaria id_cliente diferencia a cada cliente, asegurando que la información personal y de contacto no se confunda entre registros.

Tabla: precio_producto
Clave primaria: id_precio (identificador único del registro de precio).
Clave foránea:
id_producto → producto(id_producto)
La clave primaria id_precio permite registrar distintos precios históricos para un mismo producto. La clave foránea asegura que el precio esté asociado a un producto existente.

Tabla: costo_producto
Clave primaria: id_costo (identificador único del registro de costo).
Clave foránea:
id_producto → producto(id_producto)
La clave primaria id_costo permite guardar los costos de compra de cada producto a lo largo del tiempo. La clave foránea garantiza la relación con un producto válido.

Tabla: venta
Clave primaria: id_venta (identificador único de la venta).
Clave foránea:
id_cliente → cliente(id_cliente)
La clave primaria id_venta identifica de manera única cada transacción de venta. La clave foránea garantiza que la venta esté asociada a un cliente registrado.

Tabla: detalle_venta
Clave primaria: id_detalle (identificador único del detalle de venta).
Claves foráneas:
id_venta → venta(id_venta)
id_producto → producto(id_producto)
La clave primaria id_detalle diferencia cada línea de productos dentro de una venta. Las claves foráneas vinculan el detalle con la venta correspondiente y con el producto vendido.

```
### Descripcion de la vistas

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

```

### Scripts de la Base de Datos (Click en los siguientes enlaces):

<br>

- <a href="./base_datos.sql"> Creacion de la Base de Datos </a><br>
- <a href="./ER_Diagrama.pdf"> Diagrama Entidad-Relacion </a><br>
- <a href="./Insercion_Datos.sql"> Inserción de Datos </a><br>

---

<br>

## Autor: German M Vinisky

### Comisión #81830 - CoderHouse



