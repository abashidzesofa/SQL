use hr;

-- Вывести имя, фамилию и зарплату тех сотрудников, 
-- которые работают в городах Oxford и San Francisco

SELECT
*
FROM employees;


SELECT
*
FROM departments;


SELECT
*
FROM locations;


SELECT 
t1.first_name,
t1.last_name,
t1.salary
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id 
WHERE t3.city IN ('Oxford', 'South San Francisco');



-- Вывести имя, фамилию и город сотрудника

SELECT 
t1.first_name,
t1.last_name,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id;



-- Вывести города и соответствующие городам страны



SELECT
*
FROM countries;

SELECT
*
FROM locations;


SELECT 
t1.city,
t2.country_name
FROM locations AS t1
INNER JOIN countries AS t2
ON t1.country_id = t2.country_id;