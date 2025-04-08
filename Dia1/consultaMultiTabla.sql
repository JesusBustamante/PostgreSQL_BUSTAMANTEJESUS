-- 1. Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos. Ordene el resultado
-- por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto,
-- identificador del fabricante y nombre del fabricante, de todos los productos
-- de la base de datos.
SELECT p.nombre, p.precio, f.codigo, f.nombre
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más barato.
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más caro.
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto
WHERE codigo_fabricante = 2;

SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante= f.codigo
WHERE f.codigo = 2;

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan
-- un precio mayor que 200€.
SELECT * FROM producto
WHERE codigo_fabricante = 6 AND precio > 200;

SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante= f.codigo
WHERE f.codigo = 6 and p.precio > 200;

-- 8. Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto
WHERE codigo_fabricante = 1 
	OR codigo_fabricante = 3 
	OR codigo_fabricante = 5;

SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.codigo = 1
	OR f.codigo = 3 
	OR f.codigo = 5;

-- 9. Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto
WHERE codigo_fabricante IN (1, 3, 5);

SELECT p.codigo, p.nombre, p.precio, p.codigo_fabricante
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.codigo IN (1, 3, 5);
	
-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los
-- fabricantes cuyo nombre termine por la vocal e.
SELECT p.nombre, p.precio 
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre ILIKE '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo
-- nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre, p.precio 
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre ILIKE '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de
-- fabricante, de todos los productos que tengan un precio mayor o igual a
-- 180€. Ordene el resultado en primer lugar por el precio (en orden
-- descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT p.nombre, p.precio, f.nombre 
FROM producto p
INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante,
-- solamente de aquellos fabricantes que tienen productos asociados en la
-- base de datos.
SELECT DISTINCT f.codigo, f.nombre
FROM fabricante f
INNER JOIN producto p ON f.codigo = p.codigo_fabricante;