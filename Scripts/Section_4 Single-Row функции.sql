--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661338#overview

--Functions
	--Single-row
		--Character - works with text
		--Numeric
		--Date
		--Conversion - конвертируют/преобразовывают тип даных
		--General - Общие, работают с Null
	--Multiple-row

-- ******************************************************************************************
--Character

	-- Case conversion ---------------------------------------------
-- -- LOWER(str)------------------------##########
--SELECT first_name, LOWER(first_name) FROM hr.employees;
--SELECT * FROM hr.employees WHERE LOWER(first_name) = 'david';
--SELECT * FROM hr.employees WHERE LOWER(first_name) LIKE '%david%';

-- -- UPPER(str)------------------------##########
--SELECT first_name, UPPER(first_name) FROM hr.employees;
--SELECT * FROM hr.employees WHERE UPPER(first_name) LIKE '%DAVID%';

-- -- INITCAP(str) - Return Every Word In Capital Letter------------------------##########
--SELECT INITCAP('hello world for you') FROM dual;

	-- Character manipulation functions ---------------------------------------------
-- -- CONCAT(str_001,[str_002, str_003]) same as - ||------------------------##########
--SELECT CONCAT(first_name, ' ', last_name) FROM hr.employees;
--SELECT CONCAT(first_name, ' ', last_name, ' ', SYSDATE) FROM hr.employees;
--SELECT first_name || ' ' || last_name || ' ' || SYSDATE FROM hr.employees;

-- -- LENGTH(str)------------------------##########
--SELECT first_name, LENGTH(first_name) AS len FROM hr.employees;
--SELECT first_name FROM hr.employees ORDER BY LENGTH(first_name) DESC, first_name;

-- -- LPAD(str, number, data_to_fill), RPAD------------------------##########
--SELECT LPAD(first_name, 15, SYSDATE+1+1||'e') ||' <-> '|| RPAD(last_name, 15, '-') FROM hr.employees;

-- -- TRIM([[trailing, leading, both] symbol FROM], string)------------------------##########
--SELECT TRIM('          Billy          ') FROM dual;
--SELECT TRIM(trailing '*' FROM 'Billy*****') AS trailed FROM dual;
--SELECT TRIM(leading '*' FROM '*****Billy') AS leading FROM dual;
--SELECT TRIM(both '*' FROM '*****Billy*****') AS both FROM dual;
--SELECT TRIM(both 7 FROM 7753425777) AS both FROM dual;

-- -- INSTR(str, what_to_search, [start_pos, Nth occurrence])------------------------##########
--SELECT * FROM hr.employees
--	WHERE INSTR(UPPER(job_id), 'PROG') = 4;

--SELECT * FROM hr.employees
--  WHERE INSTR(TO_CHAR(hire_date, 'DD.MM.YYYY'), '05') = 4;

--SELECT INSTR('Bill Gates', 'G') FROM dual; -- 6

--SELECT TO_CHAR(SYSDATE, 'DD.MM.YYYY') AS now_date,
--	INSTR(TO_CHAR(SYSDATE, 'DD.MM.YYYY'), '08') FROM dual; -- 4

-- -- SUBSTR(str, start_pos, [num_of_chars])------------------------##########
--SELECT email, SUBSTR(email, 4, 2) FROM hr.employees;
--SELECT email, SUBSTR(email, -4, 2) FROM hr.employees;

-- -- REPLACE(str, search_item, replacement_item)------------------------##########
--SELECT REPLACE ('Hello world', 'o') FROM dual; -- remove 'o' from text - Hell wrld
--SELECT REPLACE ('Hello world', 'o', '#') FROM dual; -- Hell# w#rld
--SELECT REPLACE ('Hello world', 'o', '#!#') FROM dual; -- Hell#!# w#!#rld
--SELECT salary, REPLACE (salary, 1, 9) FROM hr.employees;
--SELECT salary, REPLACE (salary, '1', '9') FROM hr.employees;

	-- Numeric functions ---------------------------------------------
-- -- ROUNND(num, precidion)------------------------##########
--SELECT ROUND(3.14) FROM dual; -- 3
--SELECT ROUND(3.50) FROM dual; -- 4
--SELECT ROUND(3.4576, 3) FROM dual; -- 3.458
--SELECT ROUND(3.4574, 3) FROM dual; -- 3.457
--SELECT ROUND(654783, -1) FROM dual; -- 654780
--SELECT ROUND(654711, -4) FROM dual; -- 654000

-- -- TRUNC(num, precidion)------------------------##########
--SELECT TRUNC(3.4576) FROM dual; -- 3
--SELECT TRUNC(3.4576, 1) FROM dual; -- 3.4
--SELECT TRUNC(3.4574, 2) FROM dual; -- 3.45
--SELECT TRUNC(654783, -2) FROM dual; -- 654700

-- -- MOD(dividend, divisor)------------------------##########
--SELECT MOD(7, 3) FROM dual; -- 1 (like 7 % 3 = 1)

--SELECT employee_id, first_name, last_name, salary FROM hr.employees
--	WHERE MOD(employee_id, 2) = 1;

--SELECT employee_id, first_name, last_name, MOD(employee_id, 3)+1 AS team_num FROM hr.employees
--	ORDER BY team_num;

	-- Date functions ---------------------------------------------
-- -- TO_CHAR(SYSDATE, 'DD-MM-YY hh24:mm:ss')
-- -- TO_DATE('25.08.2026', 'DD.MM.YYYY')

--SELECT * FROM nls_session_parameters;
--SELECT * FROM nls_session_parameters WHERE PARAMETER='NLS_DATE_FORMAT';

-- -- SYSDATE------------------------##########
--SELECT SYSDATE FROM dual; -- server time
--SELECT SYSDATE-7 week_ago, SYSDATE today, SYSDATE+7 after_week FROM dual;
--SELECT TO_CHAR(SYSDATE, 'DD-MM-YY hh24:mm:ss') FROM dual; -- server time
--SELECT first_name, TRUNC(SYSDATE-hire_date, 2) FROM hr.employees;

-- -- MONTHS_BETWEEN(start_date, end_date)------------------------##########

--SELECT MONTHS_BETWEEN(
--		TO_DATE('25.08.2026', 'DD.MM.YYYY'),
--		TO_DATE('18.05.2026', 'DD.MM.YYYY')
--		) AS month_between
--	FROM dual;

--SELECT employee_id, start_date, end_date,
--		TRUNC(MONTHS_BETWEEN(end_date, start_date), 2)
--	FROM hr.job_history;

-- -- ADD_MONTHS------------------------##########
--SELECT employee_id, start_date, end_date,
--		ADD_MONTHS(end_date, 4) AS end_plus_4
--	FROM hr.job_history;
--
--SELECT employee_id, start_date, end_date,
--		ADD_MONTHS(end_date, -4) AS end_minus_4
--	FROM hr.job_history;

-- -- NEXT_DAY(date, day_of_the_week)------------------------##########
-- -- day_of_the_week (depends on zone) - for AMERICAN 1 is sunday, 7 is saturday
--SELECT * FROM nls_session_parameters;
--SELECT NEXT_DAY(TO_DATE('18.08.2026', 'DD.MM.YYYY'), 7) AS next FROM dual; -- 22.08.2026

-- -- LAST_DAY------------------------##########
--SELECT LAST_DAY(TO_DATE('18.08.2026', 'DD.MM.YYYY')) AS last_day_of_month FROM dual
--SELECT hire_date, LAST_DAY(hire_date) - hire_date AS Days FROM hr.employees;

-- -- ROUND(date, date_precision_format)------------------------##########
-- date_precision_formats - [age - CC], [year - YYYY], [quarter - Q], [month - MM],
						 -- [week - W], [day - DD], [hour - HH], [min - MI]

--SELECT first_name, hire_date,
--	ROUND(hire_date, 'MM') AS rounded
--	FROM hr.employees
--	WHERE employee_id IN(120, 121)

-- -- TRUNC(date, date_precision_format) ------------------------##########
-- date_precision_formats - [age - CC], [year - YYYY], [quarter - Q], [month - MM],
						 -- [week - W], [day - DD], [hour - HH], [min - MI]
-- like with number it just cut to date_precision_format

--SELECT first_name, hire_date,
--	TRUNC(hire_date, 'MM') AS truncated
--	FROM hr.employees
--	WHERE employee_id IN(120, 121)

--1. Получите список всех сотрудников, у которых длина имени больше 10 букв.
--SELECT first_name, last_name FROM hr.employees WHERE LENGTH(first_name) > 10;

--2. Получите список всех сотрудников, зарплата которых кратна 1000.
--SELECT first_name, last_name, salary FROM hr.employees WHERE MOD(salary, 1000) = 0;

--3. Выведите телефонный номер и первое 3х значное число телефонного номера сотрудника, если его номер представлен в формате ХХХ.ХХХХ%.
--SELECT first_name, last_name, phone_number, SUBSTR(phone_number, 1, 3) FROM hr.employees
--	WHERE phone_number LIKE('__.____%');

--4. Получите список всех сотрудников, у которых последняя буква в имени равна 'm' и длина имени больше 5ти.
--SELECT first_name, last_name FROM hr.employees
--	WHERE first_name LIKE('%m') AND LENGTH(first_name) > 5;

--5. Выведите дату следующей пятницы.
--SELECT NEXT_DAY(SYSDATE, 'friday') AS next_friday FROM dual;

--6. Получите список всех сотрудников, которые работают в компании больше 12 лет и 6ти месяцев (150 месяцев).
--SELECT first_name, last_name, hire_date FROM hr.employees
--	WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 12.5*12;

--7. Выведите телефонный номер, заменив в значении PHONE_NUMBER все '.' на '-'.
--SELECT first_name, last_name, phone_number, REPLACE(phone_number, '.', '-') FROM hr.employees;

--8. Выведите имя, email, job_id для всех работников в формате: STEVEN sking Ad_Pres
--SELECT UPPER(first_name), LOWER(email), INITCAP(job_id) FROM hr.employees;

--9. Выведите информацию о имени работника и его з/п, не используя символ || , в таком виде: Steven24000
--SELECT CONCAT(INITCAP(first_name), salary) FROM hr.employees;

--10.Выведите информацию о дате приёма сотрудника на работу, округлённой дате приёма на работу до месяца и первом дне года приёма на работу.
--SELECT first_name, hire_date, ROUND(hire_date, 'MM'), TRUNC(hire_date, 'YYYY') FROM hr.employees;

--11.Выведите информацию о имени и фамилии всех работников.
	-- Имя должно состоять из 10 символов и если длина имени меньше 10,
		-- то дополняйте до 10 символов знаком $.
	-- Фамилия должна состоять из 15 символов и если длина фамилии меньше 15,
		-- то перед фамилией ставьте столько знаков ! сколько необходимо.
--SELECT RPAD(first_name, 10, '$'), LPAD(last_name, 15, '!') FROM hr.employees;

--12.Выведите имя сотрудника и позицию второй буквы ‘a’ в его имени.
-- str, what_to_search, [start_pos, Nth occurrence]
--SELECT first_name, INSTR(first_name, 'a', 1, 2) FROM hr.employees;

--13.Выведите на экран текст '!!!HELLO!! MY FRIEND!!!!!!!!' и тот же текст, но без символа восклицательный знак в начале и конце текста.
--SELECT TRIM(BOTH '!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!') FROM dual;

--14.Выведите информацию о:
-- з/п работника,
-- з/п умноженной на коэффициент 3.1415,
-- округлённый до целого значения вариант увеличенной з/п-ты,
-- целое количество тысяч из увеличенной з/п.

--SELECT first_name, salary, salary*3.1415 AS indexed,
--	ROUND(salary*3.1415) AS rounded,
--	TRUNC(salary*3.1415, -3) / 1000 AS rounded_to_1000
--FROM hr.employees;

--15.Выведите информацию о:
-- дате приёма сотрудника на работу,
-- дате, которая была через пол года, после принятия сотрудника на работу,
-- дате последнего дня в месяце принятия сотрудника на работу.

--SELECT first_name, hire_date, ADD_MONTHS(hire_date, 6), LAST_DAY(hire_date) FROM hr.employees;





















