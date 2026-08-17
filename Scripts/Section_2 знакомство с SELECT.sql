--SELECT * from hr.countries;
--SELECT * from hr.departments;
--SELECT * from hr.employees;
--SELECT * from hr.jobs;
--SELECT * from hr.job_history;
--SELECT * from hr.locations;
--SELECT * from hr.regions;

--Ctrl + Shift + Y - lower
--Ctrl + Shift + X - UPPER

-- PROJECTION - выбор столбцов из таблици
-- SELECTION - выбор строк из таблици
-- JOINING - объединение таблиц

-- ******************************************************************************************
-- -- SELECT col_name_001 [, col_name_002...] FROM shema.table
--SELECT * from hr.employees;
--SELECT * from hr.departments;
--SELECT country_name from hr.countries;
--SELECT first_name, last_name, salary from hr.employees;

-- ******************************************************************************************
-- -- DISTINCT - retrn only unic values (for all cols)
--SELECT DISTINCT job_id from hr.job_history;
--SELECT DISTINCT job_id, department_id from hr.job_history;
--SELECT DISTINCT commission_pct from hr.employees; -- only 1 (one) NULL

-- ******************************************************************************************
-- -- Expressions in SELECT
--SELECT first_name, salary, salary*2, salary*2+employee_id AS bred  from hr.employees;
--SELECT first_name, commission_pct, commission_pct/2 from hr.employees;
--SELECT * from hr.JOB_HISTORY;
--SELECT start_date, end_date, (end_date-start_date) + 1 AS days from hr.job_history;
--SELECT start_date, start_date+7 AS week from hr.job_history;

-- ******************************************************************************************
-- -- Concatenation - ||
-- -- Alias: col_name alias, col_name AS alias, col_name "Your Alias"
--SELECT first_name || last_name || salary from hr.employees;

--SELECT 'My name is ' || first_name || 
--	' last name ' || last_name || 
--	' last salary: ' || salary
--	AS combined_text
--FROM hr.employees;

-- ******************************************************************************************
-- -- DUAL
--SELECT * FROM dual;
--SELECT dummy FROM dual;
--SELECT 'abc_'||'xyz_'||(90*30) AS result FROM dual;
--SELECT 41*365*24*60*60 AS "my age in sec" FROM dual;
--SELECT ( SYSDATE - TO_DATE('24.02.1985', 'DD.MM.YYYY') ) *24*60*60 AS "my age in sec" FROM dual

-- -- Delimiter - q'< ... >'
--SELECT 'It''s my life' FROM dual;
--SELECT q'<It's my life>' FROM dual;

-- ****************************************************************************************** HOME WORK
--1. Выведите всю информацию о регионах.
--SELECT * FROM hr.regions;

--2. Выведите информацию о имени, id департамента, зарплате и фамилии для всех работников.
--SELECT first_name, department_id, salary, last_name FROM hr.employees;

--3. Выведите информацию о id работника, электронной почте и дату, которая была за неделю до трудоустройства для всех работников. Столбец, который будет содержать дату назовите One week before hire date.
--SELECT employee_id, email, hire_date, hire_date-7 AS "One week before hire date" FROM hr.employees;

--4. Выведите информацию о работниках с их позициями в формате: Donald(SH_CLERK). Назовите столбец our_employees.
--SELECT first_name || ' (' || job_id || ')' AS our_employees FROM hr.employees;

--5. Выведите список уникальных имён среди работников.
--SELECT DISTINCT first_name AS only_unic FROM hr.employees;

--6. Выведите следующую информацию из таблицы jobs:
--	 job_title,
--	 выражение в формате: «min = 20080, max = 40000», где 20080 – это минимальная з/п, а 40000 – максимальная. Назовите этот столбец info.
--	 максимальную з/п и назовите столбец max,
--	 новую з/п, которая будет называться new_salary и вычисляться по формуле: max_salary*2-2000.

--SELECT 
--	job_title,
--	'min = ' || MIN_SALARY || ', max = ' || MAX_SALARY AS info,
--	MAX_SALARY AS max,
--	max_salary*2-2000 AS new_salary
--FROM hr.jobs;

--7. Выведите на экран предложение «Peter's dog is very clever», используя одну из двух техник работы с одинарными кавычками.
--SELECT q'<Peter's dog is very clever>' FROM dual

--8. Выведите на экран предложение «Peter's dog is very clever», используя, отличную от предыдущего примера, технику работы с одинарными кавычками.
--SELECT 'Peter''s dog is very clever' FROM dual

--9. Выведите на экран количество минут в одном веке (1 год = 365.25 дней).
--SELECT 100*365.25*24*60 FROM dual
































