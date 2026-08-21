--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661338#overview

--Functions
	--Single-row
		--Character - works with text
		--Numeric
		--Date
		--Conversion - конвертируют/преобразовывают тип даных
		--General - Общие, работают с Null
	--Multiple-row

	-- Case conversion ---------------------------------------------
-- LOWER(str)
-- UPPER(str)
-- INITCAP(str) - Return Every Word In Capital Letter

	-- Character manipulation functions ------------------------------
-- CONCAT(str_001,[str_002, str_003]) same as - ||
-- LENGTH(str)
-- LPAD(str, number, data_to_fill)
-- RPAD(str, number, data_to_fill)
-- TRIM([[trailing, leading, both] symbol FROM], string)
-- INSTR(str, what_to_search, [start_pos, Nth occurrence])
-- SUBSTR(str, start_pos, [num_of_chars])
-- REPLACE(str, search_item, replacement_item)

	-- Numeric functions ---------------------------------------------
-- ROUNND(num, precidion)
-- TRUNC(num, precidion)
-- MOD(dividend, divisor) - like 7 % 3 = 1

	-- Date functions ------------------------------------------------
-- TO_DATE('25.08.2026', 'DD.MM.YYYY')
-- SYSDATE
-- MONTHS_BETWEEN(start_date, end_date)
-- ADD_MONTHS
-- NEXT_DAY(date, day_of_the_week)
-- LAST_DAY(TO_DATE('18.08.2026', 'DD.MM.YYYY'))

-- ROUND(date, date_precision_format)
-- date_precision_formats - [age - CC], [year - YYYY], [quarter - Q], [month - MM],
						 -- [week - W], [day - DD], [hour - HH], [min - MI]

-- TRUNC(date, date_precision_format)
-- date_precision_formats - [age - CC], [year - YYYY], [quarter - Q], [month - MM],
						 -- [week - W], [day - DD], [hour - HH], [min - MI]
-- like with number it just cut to date_precision_format

	-- Conversion ----------------------------------------------------
-- TO_CHAR(SYSDATE, 'DD-MM-YY hh24:mm:ss')
-- TO_CHAR(number[, format_mask, nls_parameters])
-- TO_DATE(text, format mask, nls_parameters)
-- TO_NUMBER(text, format_mask, nls_parameters)

	-- General functions
-- NVL(value, ifnull) -- value, ifnull - must be same type
-- NVL2(value, ifnotnull, ifnull) -- value, ifnotnull, ifnull - must be same type
-- -- NULLIF(val_1, val_2)
	-- val_1, val_2 - must be same type 
	-- IF(val_1 == val_2) -> NULL
	-- IF(val_1 != val_2) -> val_1 
	-- val_2 - will NEVER return
-- COALESCE(val_1, val_2[, ... val_N]) -- вернёт первое НЕ Null значение из списка значений или вернёт Null если все Null

	-- Conditional functions -----------------------------------------
-- DECODE() -- IF / ELSE IF / ELSE
		--DECODE(
		--    expression,
		--    search1, result1,
		--    search2, result2,
		--    searchN, resultN,
		--    default_result
		--)

-- Simple CASE()
	--CASE expr
	--	WHEN comp_1 THEN if_true_1
	--	WHEN comp_2 THEN if_true_2
	--	...
	--	WHEN comp_N THEN if_true_N
	--	ELSE if_false
	--END

-- Searched CASE() - used for different conditions
	--CASE
	--	WHEN cond_1 THEN if_true_1
	--	WHEN cond_2 THEN if_true_2
	--	...
	--	WHEN cond_N THEN if_true_N
	--	ELSE if_false
	--END

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





















