

use hr;

-- Task 1 -- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt

SELECT
*
FROM employees;

SELECT
manager_id,
COUNT(*) AS employees_cnt
FROM employees
GROUP BY(manager_id);


-- Task 2 -- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employeescnt

SELECT 
t2.first_name,
t2.last_name,
COUNT(*) AS employees_cnt
FROM employees AS t1
INNER JOIN employees AS t2
ON t1.manager_id = t2.employee_id
GROUP BY t1.manager_id, t2.first_name, t2.last_name;


-- Task 3 --  Найти сотрудников, у которых наибольшая зарплата в их департаменте

SELECT
*
FROM employees;


SELECT
*
FROM departments;

SELECT
t1.first_name,
t1.salary,
t2.department_name
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
WHERE (t1.department_id, t1.salary) IN (SELECT
										t3.department_id,
										MAX(salary) AS max_salary
										FROM employees AS t3
										GROUP BY t3.department_id);





-- Task 4 -- Найти максимальную зарплату в каждом департаменте. Вывести departmentid и max_salary

SELECT
department_id,
MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;
