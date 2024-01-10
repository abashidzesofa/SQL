-- Создайте таблицу goods (id, title, quantity)

CREATE database homework_2;
use homework_2;
CREATE table goods (
id integer,
title varchar(64),
quantity integer
);

-- Добавьте несколько строк

INSERT INTO goods (id, title, quantity) VALUES (1, 'One', 5),
											   (2, 'Two', 10),
                                               (3, 'Three', 15),
                                               (4, 'Four', 20);
                                               
SELECT
*
FROM goods;  


-- Добавьте поле price (integer) со значением по умолчанию 0   

ALTER TABLE goods
ADD COLUMN price integer DEFAULT 0;  

-- Измените тип поля price на numeric(8, 2)
-- перед изменением типа необходимо очистить поле

UPDATE goods
SET price = null;         

ALTER TABLE goods
MODIFY COLUMN price numeric(8.2);   

-- Измените тип обратно на integer

ALTER TABLE goods
MODIFY COLUMN price integer;        

-- Переименуйте поле на item_price

ALTER TABLE goods
CHANGE price item_price integer;

-- Удалите это поле

ALTER TABLE goods
DROP COLUMN item_price;              