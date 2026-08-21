--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661438#overview

--Functions
	--Single-row
		--Character - works with text
		--Numeric
		--Date
		--Conversion - конвертируют/преобразовывают тип даных
		--General - Общие, работают с Null
	--Multiple-row

--SELECT * FROM NLS_SESSION_PARAMETERS;
--ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';
--ALTER SESSION SET NLS_TERRITORY = 'AMERICA';
--ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ******************************************************************************************
-- -- TO_CHAR(number[, format_mask, nls_parameters]) = T -- --
-- nls - national language support

--SELECT TO_CHAR(777) FROM dual; -- 777
--SELECT TO_CHAR(777, '9999999') FROM dual; --   777
--SELECT TO_CHAR(777, '0999999') FROM dual; -- 0000777
--SELECT TO_CHAR(777.88, '0999.999') FROM dual; -- 0777.880
--SELECT TO_CHAR(777.88, '0999D999') FROM dual; -- 0777.880
--SELECT TO_CHAR(1000999, '099,999,999') FROM dual; -- 001,000,999
--SELECT TO_CHAR(1000999, '999,999,999') FROM dual; -- 1,000,999
--SELECT TO_CHAR(1000999, '099G999G999') FROM dual; -- 001,000,999
--SELECT TO_CHAR(1000999, '999G999G999') FROM dual; -- 1,000,999
--SELECT TO_CHAR(1000999, '$099999999') FROM dual; -- $001000999
--SELECT TO_CHAR(1000999, '$9999999') FROM dual; -- $1000999
--SELECT TO_CHAR(1000999, 'L0999999') FROM dual; --           $1000999
--SELECT TO_CHAR(-1000999, '0999999') FROM dual; -- -1000999
--SELECT TO_CHAR(-1000999, '0999999MI') FROM dual; -- 1000999-
--SELECT TO_CHAR(-1000999, '0999999PR') FROM dual; -- <1000999>
--SELECT TO_CHAR(1000999, '0999999S') FROM dual; -- 1000999+
--SELECT TO_CHAR(1000999, 'S0999999') FROM dual; -- +1000999

-- -- TO_CHAR and dates

-- 'NLS_DATE_LANGUAGE=UKRAINIAN'
-- 'NLS_DATE_LANGUAGE=AMERICAN'
-- fm - to remove spaces

-- SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD.MM.YYYY') FROM dual;

-- 2026 - Y=6, YY=26, YYY=026, YYYY=2026, RR=26, YEAR=TWENTY TWENTY-SIX
-- 01.08.2026 - MM=08, MON=AUG, MONTH=AUGUST
-- 01.08.2026 - D=num day of week (depends of NLS), DD=01, DDD=215 (day of year), DY[Dy, dy]=SAT, DAY[Day, day]=SATURDAY,
-- 01.08.2026 - W=1 (week of month), WW=31 (week of year), Q=3(quart of year), CC=21 century
-- AM, PM, A.M., P.M. - marker, return AM or PM
-- HH, HH12, HH24 - time format
-- MI - minutes as num
-- SS - seconds as num
-- SSSSS - seconds after midnight 34957
-- -/.,?#! - possible punctuation
-- [SP, Sp, sp] 'DDsp MMsp YYYYsp' - writes by words
-- TH - 'DDth' - 01TH
-- and other bullshit if you need

--SELECT SYSDATE, TO_CHAR(SYSDATE, 'fmMONTH', 'NLS_DATE_LANGUAGE=AMERICAN') FROM dual;
--SELECT SYSDATE, TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE=AMERICAN') || 'WITHOUT fm' FROM dual;
--SELECT SYSDATE, TO_CHAR(SYSDATE, 'fmMONTH', 'NLS_DATE_LANGUAGE=AMERICAN') || 'WITH fm' FROM dual;

-- ******************************************************************************************
-- -- TO_DATE(text, format mask, nls_parameters)
	-- -- Depends on TO_CHAR dates
	-- -- fx modifire nid strait format
--SELECT TO_DATE() FROM dual;

-- ******************************************************************************************
-- -- TO_NUMBER(text, format_mask, nls_parameters)
--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661458#overview
--SELECT TO_NUMBER('4555', '99999') FROM dual; -- 4,555
--SELECT TO_NUMBER('4,555.77', '999,999.999') FROM dual; -- 4,555.77
--SELECT TO_NUMBER('<4,555.77>', '999,999.999PR') FROM dual; -- -4,555.77

-- ******************************************************************************************
-- -- Nested functions
--SELECT LENGTH(UPPER(SYSDATE)) FROM dual;

-- ******************************************************************************************
-- -- General functions
-- NVL(value, ifnull) -- value, ifnull - must be same type
--SELECT NVL(88, 99) FROM dual; -- 88
--SELECT NVL(null, 99) FROM dual; -- 99
--SELECT first_name, NVL(commission_pct, 0) FROM hr.employees
--SELECT first_name, NVL(SUBSTR(first_name, 6), 'too short') FROM hr.employees;

-- -- NVL2(value, ifnotnull, ifnull) -- value, ifnotnull, ifnull - must be same type
--SELECT NVL2(88, 44, 99) FROM dual; -- 44
--SELECT NVL2(null, 44, 99) FROM dual; -- 99
--SELECT first_name, NVL2(commission_pct, commission_pct, 0) FROM hr.employees

-- -- NULLIF(val_1, val_2)
-- val_1, val_2 - must be same type 
-- IF(val_1 == val_2) -> NULL
-- IF(val_1 != val_2) -> val_1 
-- val_2 - will NEVER return

-- COALESCE(val_1, val_2[, ... val_N])
-- вернёт первое НЕ Null значение из списка значений и вернёт Null если все Null 

-- ******************************************************************************************
-- -- Conditional functions

-- ******************************************************************************************
-- -- DECODE() -- IF / ELSE IF / ELSE
		--DECODE(
		--    expression,
		--    search1, result1,
		--    search2, result2,
		--    searchN, resultN,
		--    default_result
		--)
	-- it like:
		--IF expression = search1
		--    THEN result1
		--ELSE IF expression = search2
		--    THEN result2
		--ELSE IF expression = search3
		--    THEN result3
		--ELSE
		--    default_result

--SELECT
--       job_id,
--       first_name,
--       DECODE(job_id,
--              'AC_ACCOUNT', 'Accounting Accountant',
--              'AC_MGR',     'Accounting Manager',
--              'AD_ASST',    'Administration Assistant',
--              'AD_PRES',    'President',
--              'AD_VP',      'Administration Vice President',
--              'FI_ACCOUNT', 'Finance Accountant',
--              'FI_MGR',     'Finance Manager',
--              'HR_REP',     'Human Resources Representative',
--              'IT_PROG',    'IT Programmer',
--              'MK_MAN',     'Marketing Manager',
--              'MK_REP',     'Marketing Representative',
--              'PR_REP',     'Public Relations Representative',
--              'PU_CLERK',   'Purchasing Clerk',
--              'PU_MAN',     'Purchasing Manager',
--              'SA_MAN',     'Sales Manager',
--              'SA_REP',     'Sales Representative',
--              'SH_CLERK',   'Shipping Clerk',
--              'ST_CLERK',   'Stock Clerk',
--              'ST_MAN',     'Stock Manager',
--              'Unknown') AS job_name
--FROM hr.employees;

-- ******************************************************************************************
-- -- -- -- Simple CASE()
	--CASE expr
	--	WHEN comp_1 THEN if_true_1
	--	WHEN comp_2 THEN if_true_2
	--	...
	--	WHEN comp_N THEN if_true_N
	--	ELSE if_false
	--END

--SELECT 
--       job_id,
--       CASE job_id
--           WHEN 'AC_ACCOUNT' THEN 'Accounting Accountant'
--           WHEN 'AC_MGR'     THEN 'Accounting Manager'
--           WHEN 'AD_ASST'    THEN 'Administration Assistant'
--           WHEN 'AD_PRES'    THEN 'President'
--           WHEN 'AD_VP'      THEN 'Administration Vice President'
--           WHEN 'FI_ACCOUNT' THEN 'Finance Accountant'
--           WHEN 'FI_MGR'     THEN 'Finance Manager'
--           WHEN 'HR_REP'     THEN 'Human Resources Representative'
--           WHEN 'IT_PROG'    THEN 'IT Programmer'
--           WHEN 'MK_MAN'     THEN 'Marketing Manager'
--           WHEN 'MK_REP'     THEN 'Marketing Representative'
--           WHEN 'PR_REP'     THEN 'Public Relations Representative'
--           WHEN 'PU_CLERK'   THEN 'Purchasing Clerk'
--           WHEN 'PU_MAN'     THEN 'Purchasing Manager'
--           WHEN 'SA_MAN'     THEN 'Sales Manager'
--           WHEN 'SA_REP'     THEN 'Sales Representative'
--           WHEN 'SH_CLERK'   THEN 'Shipping Clerk'
--           WHEN 'ST_CLERK'   THEN 'Stock Clerk'
--           WHEN 'ST_MAN'     THEN 'Stock Manager'
--           ELSE 'Unknown'
--       END AS job_name
--FROM hr.employees;

-- ******************************************************************************************
-- -- -- -- Searched CASE() - used for different conditions
	--CASE
	--	WHEN cond_1 THEN if_true_1
	--	WHEN cond_2 THEN if_true_2
	--	...
	--	WHEN cond_N THEN if_true_N
	--	ELSE if_false
	--END

--SELECT first_name, last_name, commission_pct, salary,
--       CASE
--           WHEN LENGTH(first_name)<=5 THEN 'Condition #1'
--           WHEN salary*10 > 100000     THEN 'Condition #2'
--           WHEN commission_pct IS NOT NULL THEN 'Condition #3'
--           ELSE 'Default Condition'
--       END AS job_name
--FROM hr.employees;


-- ****************************************************************************************** Home Work
--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661506#overview

--1. Используя функции, получите список всех сотрудников у которых в имени есть буква 'b' (без учета регистра).
--SELECT * FROM hr.employees WHERE LOWER(first_name) LIKE('%b%');

--2. Используя функции, получите список всех сотрудников у которых в имени содержатся минимум 2 буквы 'a'.
--SELECT * FROM hr.employees WHERE LOWER(first_name) LIKE('%a%a%');

--3. Получите первое слово из имени департамента, для тех департаментов, у которых название состоит больше, чем из одного слова.
--SELECT department_name, SUBSTR(department_name, 1, INSTR(department_name, ' ')-1)
--	FROM hr.departments WHERE INSTR(department_name, ' ') > 0;

--4. Получите имена сотрудников без первой и последней буквы в имени.
--SELECT first_name, SUBSTR(first_name, 2, LENGTH(first_name)-2)  FROM hr.employees;

--5. Получите список всех сотрудников, у которых в значении job_id после знака '_' как минимум 3 символа, но при этом это значение после '_' не равно 'CLERK'.
--SELECT first_name, job_id, SUBSTR(job_id, INSTR(job_id, '_')+1) FROM hr.employees
--	WHERE job_id NOT LIKE '%CLERK' AND LENGTH(SUBSTR(job_id, INSTR(job_id, '_')+1)) > 2;

--6. Получите список всех сотрудников, которые пришли на работу в первый день любого месяца.
--SELECT first_name, hire_date, LAST_DAY(ADD_MONTHS(hire_date, -1))+1 AS frist_day FROM hr.employees
--	WHERE hire_date = LAST_DAY(ADD_MONTHS(hire_date, -1))+1;

--7. Получите список всех сотрудников, которые пришли на работу в 2012ом году.
--SELECT first_name, hire_date, TO_CHAR(hire_date, 'YYYY') FROM hr.employees
--	WHERE TO_NUMBER(TO_CHAR(hire_date, 'YYYY')) = 2012;

--8. Покажите завтрашнюю дату в формате: Tomorrow is Second day of January
SELECT SYSDATE, TO_CHAR(SYSDATE, '"Tomororw is "Ddspth" day of "Month')
	FROM dual;
-- Here is 'Ddspth' stands for - 'Dd' as Day 'sp' - written by words and with 'th'

--SELECT SYSDATE,
--	'Tomororw is ' || INITCAP(TO_CHAR(SYSDATE+1, 'DDspth')) || ' day of ' || INITCAP(TO_CHAR(SYSDATE+1, 'MONTH'))
--	FROM dual;

--9. Выведите имя сотрудника и дату его прихода на работу в формате: 21st of June, 2007
--10.Получите список работников с увеличенными зарплатами на 20%. Зарплату показать в формате: $28,800.00
--11.Выведите актуальную дату (нынешнюю), + секунда, + минута, + час, + день, + месяц, + год. (Всё это по отдельности прибавляется к актуальной дате).
--12.Выведите имя сотрудника, его з/п и новую з/п, которая равна старой плюс это значение текста «$12,345.55».
--13.Выведите имя сотрудника, день его трудоустройства, а также количество месяцев между днём его трудоустройства и датой, которую необходимо получить из текста «SEP, 18:45:00 18 2009».
--14.Выведите имя сотрудника, его з/п, а также полную з/п (salary + commission_pct(%)) в формате: $24,000.00 .
--15.Выведите имя сотрудника, его фамилию, а также выражение «different length», если длина имени не равна длине фамилии или выражение «same length», если длина имени равна длине фамилии. Не используйте conditional functions.
--16.Выведите имя сотрудника, его комиссионные, а также информацию о наличии бонусов к зарплате – есть ли у него комиссионные (Yes/No).
--17.Выведите имя сотрудника и значение которое его будет характеризовать: значение комиссионных, если присутствует, если нет, то id его менеджера, если и оно отсутствует, то его з/п.
--18.Выведите имя сотрудника, его з/п, а также уровень зарплаты каждого сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 и меньше 10000 считается Normal level, Больше или равно 10000 считается High level.
--19.Для каждой страны показать регион, в котором она находится: 1-Europe, 2-America, 3-Asia, 4-Africa . Выполнить данное задание, не используя функционал JOIN. Используйте DECODE.
--20.Задачу №19 решите используя CASE.
--21.Выведите имя сотрудника, его з/п, а также уровень того, насколько у сотрудника хорошие условия :
-- BAD: з/п меньше 10000 и отсутствие комиссионных;
-- NORMAL: з/п между 10000 и 15000 или, если присутствуют комиссионные;
-- GOOD: з/п больше или равна 15000.














