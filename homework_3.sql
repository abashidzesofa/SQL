
CREATE DATABASE homework_3;
use homework_3;
use learn;


-- 1.Вывести информацию о товарах и их стоимости.
-- Результатом должна быть таблица с названием товара(из goods), 
-- его стоимость(из goods_two) и признак наличия на складе (из goods)

SELECT 
*
FROM goods;

SELECT
*
FROM goods_two;

SELECT 
t1.title,
t2.price,
t1.in_stock 
FROM goods AS t1
INNER JOIN goods_two AS t2
ON t1.id = t2.id; 




-- Используйте базу данных airport(скрипт есть в репозитории);
-- 2.Вывести информацию в одну таблицу о клиентах(поля id, name,) 
-- и о билетах, которые они купили (поля id(билета),price,service_class)

SELECT
*
FROM clients;

SELECT 
*
FROM tickets;

use airport;
SELECT
t1.id,
t1.name,
t2.id,
t2.price,
t2.service_class
FROM clients AS t1
INNER JOIN tickets AS t2
ON t1.id = t2.client_id;




-- 3.Вывести информацию в одну таблицу о билетах (поля id(билета),price,service_class) 
-- и информацию откуда и куда была совершена поездка(departure, arrival)

SELECT
*
FROM tickets;

SELECT 
*
FROM trips;

SELECT
t1.id,
t1.price,
t1.service_class,
t2.departure,
t2.arrival
FROM tickets AS t1
INNER JOIN trips AS t2
ON t1.trip_id = t2.id;




-- 4.Вывести информацию о самолетах, которые никуда не летали.

SELECT
*
FROM trips;

SELECT
*
FROM airliners;

SELECT
*
FROM airliners
WHERE id IN (SELECT airliner_id
			 FROM trips
			 WHERE status = 'Cancelled');


-- 5.Вывести информацию о клиентах, которые никуда не летали.

SELECT
*
FROM clients;
SELECT
*
FROM tickets;

SELECT
*
FROM trips;


SELECT
t1.*
FROM clients AS t1
INNER JOIN tickets
ON t1.id = tickets.client_id
INNER JOIN trips
ON tickets.trip_id = trips.id
WHERE trips.status = 'Cancelled';


-- 6.** Вывести всю информацию о клиентах, билетах которые они купил 
-- и поездках которую они совершил (join трех таблиц)

SELECT
*
FROM clients;

SELECT
*
FROM tickets;

SELECT
*
FROM trips;


SELECT
t1.*,
t2.*,
t3.*
FROM clients AS t1
INNER JOIN tickets AS t2
ON t1.id = t2.client_id
INNER JOIN trips AS t3
ON t2.trip_id = t3.id;
