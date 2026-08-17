--SELECT * FROM hr.countries;
--SELECT * FROM hr.departments;
--SELECT * FROM hr.employees;
--SELECT * FROM hr.jobs;
--SELECT * FROM hr.job_history;
--SELECT * FROM hr.locations;
--SELECT * FROM hr.regions;

-- ******************************************************************************************
-- -- WHERE condition(s) - =, !=, <>, <, >, >=, <=
--SELECT * FROM hr.employees;

--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE last_name = 'King';

--SELECT first_name, last_name, hire_date FROM hr.employees
--	WHERE hire_date = TO_DATE('21.09.2015', 'DD.MM.YYYY');

--SELECT first_name, salary, TO_CHAR(hire_date, 'DD.MM.YYYY') FROM employees
--	WHERE hire_date = TO_DATE('17.06.2013', 'DD.MM.YYYY');

--SELECT * FROM hr.departments
--	WHERE location_id = 1700;

--SELECT * FROM hr.job_history
--	WHERE job_id = 'ST_CLERK';

--SELECT * FROM hr.employees
--	WHERE 'Dr ' || FIRST_NAME || ' ' || LAST_NAME  = 'Dr Steven King';

--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE salary != 17000;

--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE salary > 10000;

-- ******************************************************************************************
-- -- BETWEEN
--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE salary BETWEEN 4000 AND 10000;

--SELECT * FROM hr.job_history
--	WHERE start_date BETWEEN TO_DATE('01.01.2004', 'DD.MM.YYYY') AND TO_DATE('31.12.2007', 'DD.MM.YYYY')

--SELECT * FROM hr.job_history
--	WHERE start_date > TO_DATE('01.01.2004', 'DD.MM.YYYY') AND start_date < TO_DATE('31.12.2006', 'DD.MM.YYYY')
	
--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE first_name BETWEEN 'A' AND 'C'; -- exclude C

-- ******************************************************************************************
-- -- IN
--SELECT * FROM hr.departments
--	WHERE LOCATION_ID IN (1700, 2400, 1500);

--SELECT * FROM hr.job_history 
--	WHERE job_id IN ('IT_PROG', 'ST_CLERK');

--SELECT * FROM employees
--	WHERE department_id IN (
--	    SELECT department_id
--	    FROM departments
--	    WHERE location_id = 1700
--	);

-- ******************************************************************************************
-- -- IS NULL, IS NOT NULL
--SELECT * FROM hr.departments
--	WHERE LOCATION_ID IN (1700, 2400, 1500) AND manager_id IS NOT NULL;

-- SELECT * FROM employees
--	WHERE commission_pct IS NULL;

-- ******************************************************************************************
-- -- LIKE
-- --	'%' - 0 or more symbols, '_' - only 1 symbol
-- -- 	ESCAPE - LIKE 'ST\_%' ESCAPE '\'

--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE 'S%';
	
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE 'A%r';
	
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE 'Alex%';

--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE 'H_r%';

--SELECT first_name, last_name, job_id FROM hr.employees
--	WHERE job_id LIKE 'ST\_%' ESCAPE '\'

-- ******************************************************************************************
-- -- AND - TRUE AND TRUE = TRUE
--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE FIRST_NAME LIKE 'A%' AND salary > 8200

-- ******************************************************************************************
-- -- OR - TRUE OR TRUE = TRUE
--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE FIRST_NAME LIKE 'A%' OR salary > 8200

-- ******************************************************************************************
-- -- NOT
--SELECT first_name, last_name, job_id FROM hr.employees
--	WHERE NOT JOB_ID = 'ST_MAN';

--SELECT first_name, last_name, job_id FROM hr.employees
--	WHERE job_id NOT IN ('ST_MAN', 'SA_REP');

--SELECT first_name, last_name, job_id FROM hr.employees
--	WHERE last_name NOT LIKE 'K%';

--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE salary NOT BETWEEN 4000 AND 10000;

--SELECT first_name, last_name, commission_pct FROM hr.employees
--	WHERE commission_pct IS NOT NULL;

-- ******************************************************************************************
-- -- Priority operators
	-- (), /, *, +, -, ||, = > < >= <=,
	-- [NOT] LIKE, IS [NOT] NULL, [NOT] IN
	-- [NOT] BETWEEN
	-- !=, <>
	-- NOT, AND, OR 

-- ******************************************************************************************
-- -- ORDER BY

-- SELECT ... FROM ... WHERE ... ORDER BY ... [ASC|DESC] [NULLS FIRST|LAST]

--SELECT first_name, last_name, salary FROM hr.employees
--  WHERE first_name != 'Steven' ORDER BY first_name;

--SELECT first_name, last_name, salary FROM hr.employees
--	ORDER BY salary;

--SELECT first_name, last_name, salary FROM hr.employees
--	WHERE job_id LIKE 'IT%'
--	ORDER BY salary;

--SELECT first_name, last_name, salary, TO_CHAR(hire_date, 'DD.MM.YYYY')
--  FROM hr.employees
--	WHERE job_id LIKE 'IT%'
--	ORDER BY hire_date DESC;

--SELECT last_name, salary, TO_CHAR(hire_date, 'DD.MM.YYYY') h_date, hire_date+salary*2 AS expr
--  FROM hr.employees
--	WHERE job_id LIKE 'IT%'
--	ORDER BY expr DESC;

--SELECT first_name, salary, commission_pct
--	FROM hr.employees 
--	ORDER BY 
--		commission_pct ASC NULLS LAST,
--		first_name DESC;

--SELECT first_name, salary FROM hr.employees ORDER BY 2 -- use number of col

--SELECT job_id, first_name, last_name, salary, hire_date FROM hr.employees
--	ORDER BY job_id DESC, last_name, 4 DESC;

-- ****************************************************************************************** HOME WORK
--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661336#overview
--1. Получите список всех сотрудников с именем David.
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name = 'David';

--2. Получите список всех сотрудников, у которых job_id равен FI_ACCOUNT.
--SELECT first_name, last_name, job_id FROM hr.employees
--	WHERE job_id = 'FI_ACCOUNT';

--3. Выведите информацию о имени, фамилии, з/п и номере департамента для сотрудников из 50го департамента с зарплатой, большей 4000.
--SELECT first_name, last_name, salary, department_id FROM hr.employees
--	WHERE department_id = 50 AND salary > 4000;

--4. Получите список всех сотрудников, которые работают или в 20м, или в 30м департаменте.
--SELECT first_name, last_name, department_id FROM hr.employees
--	WHERE department_id IN (20, 30);

--5. Получите список всех сотрудников, у которых вторая и последняя буква в имени равна 'a'.
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE '_a%a';

--6. Получите список всех сотрудников из 50го и из 80го департамента, у которых есть бонус(комиссионные). Отсортируйте строки по email (возрастающий порядок), используя его порядковый номер.
--SELECT * FROM hr.employees
--	WHERE department_id IN (50, 80) 
--		AND commission_pct IS NOT NULL
--	ORDER BY 4 ASC; -- in this case by EMAIL

--7. Получите список всех сотрудников, у которых в имени содержатся минимум 2 буквы 'n'.
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE '%n%n%';

--8. Получить список всех сотрудников, у которых длина имени больше 4 букв. Отсортируйте строки по номеру департамента (убывающий порядок) так, чтобы значения “null” были в самом конце.
--SELECT first_name, last_name, department_id FROM hr.employees
--	WHERE first_name LIKE '_____%' 
--	ORDER BY department_id DESC NULLS LAST;

--9. Получите список всех сотрудников, у которых зарплата находится в промежутке от 3000 до 7000 (включительно), нет бонуса (комиссионных) и job_id среди следующих вариантов: PU_CLERK, ST_MAN, ST_CLERK.
--SELECT first_name, last_name, salary, commission_pct, job_id FROM hr.employees
--	WHERE salary BETWEEN 3000 AND 7000 
--		AND commission_pct IS NULL 
--		AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

--10.Получите список всех сотрудников у которых в имени содержится символ '%'.
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE '%\%%' ESCAPE '\';

--11.Выведите информацию о job_id, имене и з/п для работников, рабочий id которых больше или равен 120 и job_id не равен IT_PROG. Отсортируйте строки по job_id (возрастающий порядок) и именам (убывающий порядок).
--SELECT employee_id, job_id, first_name, last_name, salary FROM hr.employees
--	WHERE employee_id >= 120 AND job_id != 'IT_PROG'
--	ORDER BY job_id, first_name DESC;










