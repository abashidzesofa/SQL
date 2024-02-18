CREATE DATABASE homework_6;
USE homework_6;

-- Task 1 : Запрос который выберет марку, год и прайс для каждой продажи(каждой saleid)

CREATE TABLE IF NOT EXISTS Sales (sale_id int, product_id int, year int, quantity int, price int);
CREATE TABLE IF NOT EXISTS  Product (product_id int, product_name varchar(10));

TRUNCATE TABLE Sales;

INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000');
INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000');

TRUNCATE TABLE Product;

INSERT INTO Product (product_id, product_name) values ('100', 'Nokia');
INSERT INTO Product (product_id, product_name) values ('200', 'Apple');
INSERT INTO Product (product_id, product_name) values ('300', 'Samsung');



SELECT
*
FROM sales;


SELECT
*
FROM product;


SELECT
t1.product_name,
t2.year,
t2.price
FROM product AS t1
INNER JOIN sales AS t2
ON t1.product_id = t2.product_id;


USE uni;


-- Task 2: Найти компетенции, которых нет ни у одного преподавателя

SELECT
*
FROM competencies;


SELECT
*
FROM teachers;


SELECT
*
FROM teachers2competencies;

SELECT
title
FROM competencies 
WHERE id NOT IN (SELECT 
				 competencies_id
				 FROM teachers2competencies);
                 
SELECT
t1.title
FROM competencies AS t1
LEFT JOIN teachers2competencies AS t2
ON t1.id = t2.competencies_id
WHERE t2.competencies_id IS NULL;                 


-- Task 3: Вывести название курса и имя старосты

SELECT
*
FROM courses;


SELECT
*
FROM students;

SELECT
*
FROM students2courses;


SELECT
t1.title,
t2.name
FROM courses AS t1
INNER JOIN students AS t2
ON t1.headman_id = t2.id;

-- Task 4: Вывести имя студента и имена старост, которые есть на курсах, которые он проходит



SELECT
t1.name AS student_name,
t4.name AS headman_name
FROM students AS t1
INNER JOIN students2courses AS t2
ON t1.id = t2.student_id
INNER JOIN courses AS t3
ON t2.course_id = t3.id
INNER JOIN students AS t4
ON t4.id = t3.headman_id;

