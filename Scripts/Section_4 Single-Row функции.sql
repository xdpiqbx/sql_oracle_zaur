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

	-- Case conversion
--LOWER(str)
--SELECT first_name, LOWER(first_name) FROM hr.employees;
--SELECT * FROM hr.employees WHERE LOWER(first_name) = 'david';
--SELECT * FROM hr.employees WHERE LOWER(first_name) LIKE '%david%';

--UPPER(str)
--SELECT first_name, UPPER(first_name) FROM hr.employees;
--SELECT * FROM hr.employees WHERE UPPER(first_name) LIKE '%DAVID%';

--INITCAP(str) - Return Every Word In Capital Letter
--SELECT INITCAP('hello world for you') FROM dual;

	-- Character manipulation functions
--CONCAT(str_001,[str_002, str_003])
--https://www.udemy.com/course/sql-oracle-certification/learn/lecture/16661366#overview
--SELECT CONCAT(first_name, ' ', last_name) FROM hr.employees;
--SELECT CONCAT(first_name, ' ', last_name, ' ', SYSDATE) FROM hr.employees;
--SELECT first_name || ' ' || last_name || ' ' || SYSDATE FROM hr.employees;

--LENGTH
--SELECT first_name, LENGTH(first_name) AS len FROM hr.employees;
--SELECT first_name FROM hr.employees ORDER BY LENGTH(first_name) DESC, first_name;
--SELECT LPAD(first_name, 15, '-') ||' '|| RPAD(last_name, 15, '-') FROM hr.employees;

--SELECT TRIM('          Billy          ') FROM dual;
--SELECT TRIM(trailing '*' FROM 'Billy*****') AS trailed FROM dual;
--SELECT TRIM(leading '*' FROM '*****Billy') AS leading FROM dual;
--SELECT TRIM(both '*' FROM '*****Billy*****') AS both FROM dual;