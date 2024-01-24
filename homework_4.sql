CREATE DATABASE homework_4;
USE homework_4;


-- 1) Создайте таблицу staff (
-- id целое число, 
-- name, строка
-- surname, строка
-- age, целое число
-- position - строка


CREATE TABLE staff (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR (64),
surname VARCHAR (64),
age INTEGER,
position VARCHAR (64)
);



-- 2) Заполните таблицу значениями из 10 строк по примеру :
-- 1,'Alex','Alexeev',24,'worker'
-- 2,'Oleg','Olegov',36,'administration'
-- и так далее.
-- В качестве возможных значений в поле position используйте worker,administration, security

INSERT INTO staff (name, surname, age, position) VALUES ('Alex', 'Alexeev', 24, 'worker'),
														('Oleg', 'Olegov', 36, 'administration'),
                                                        ('Ivan', 'Ivanov', 45, 'security'),
                                                        ('Nikita', 'Nikitov', 19, 'worker'),
                                                        ('Viktor', 'Viktorov', 25, 'worker'),
                                                        ('Petr', 'Petrov', 53, 'administration'),
                                                        ('Anna', 'Annova', 39, 'security'),
                                                        ('Marat', 'Maratov', 27, 'worker'),
                                                        ('Giorgi', 'Georgiev', 61, 'security'),
                                                        ('Vera', 'Verova',43, 'administration');
                                                  
												


SELECT
*
FROM staff;


-- 3) Добавьте в уже готовую и заполненную таблицу поле salary - целое число.

ALTER TABLE staff 
ADD salary INTEGER;



-- 4) Проставьте значение поля salary следующим образом :
-- если сотрудник категории worker - 1000
-- если сотрудник категории administration - 5000
-- если сотрудник категории security - 2000

SET SQL_SAFE_UPDATES = 0;
UPDATE staff
SET salary =
CASE
	WHEN position = 'worker'
		THEN 1000
	WHEN position = 'administration'
		THEN 5000
	WHEN position = 'security'
		THEN 2000
END;

SELECT
*
FROM staff;


-- 5) Увеличьте всем сотрудникам зарплату в два раза.

UPDATE staff
SET salary = salary * 2;

SELECT
*
FROM staff;



-- 6) Удалите из таблицы сотрудников, чей возраст больше чем 45.

DELETE FROM staff
WHERE age > 45;

SELECT
*
FROM staff;



-- 7) Создайте три представления(view) : первое - хранит только сотрудников типа worker, второй - security,
-- третье administration

CREATE VIEW V_workers AS
SELECT
*
FROM staff
WHERE position = 'worker';

SELECT
*
FROM V_workers;

CREATE VIEW V_securitys AS
SELECT
*
FROM staff
WHERE position = 'security';

SELECT
*
FROM V_securitys;


CREATE VIEW V_administrations AS
SELECT
*
FROM staff
WHERE position = 'administration';

SELECT
*
FROM V_administrations;



-- 8) Создайте новую таблицу на основе выборки из таблицы staff , которая будет хранить только name,surname,position
-- сотрудников , которые относятся к administration

CREATE TABLE administration_staff AS 
SELECT
name,
surname,
position
FROM staff
WHERE position = 'administration';

SELECT
*
FROM administration_staff;


-- 9) Удалите колонку position из новой таблицы.

ALTER TABLE administration_staff
DROP COLUMN position;

SELECT
*
FROM administration_staff;
