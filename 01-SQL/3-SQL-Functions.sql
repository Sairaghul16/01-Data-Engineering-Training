USE company_training;


-- 1. STRING FUNCTIONS

-- UPPER()
SELECT staff_name, UPPER(staff_name) AS name_in_uppercase
FROM staff;

-- LOWER()
SELECT staff_name, LOWER(staff_name) AS name_in_lowercase
FROM staff;

-- LEN()
SELECT staff_name, LEN(staff_name) AS total_characters
FROM staff;

-- CONCAT()
SELECT CONCAT(staff_name, ' works as ', job_role) AS staff_information
FROM staff;

-- LEFT()
SELECT staff_name, LEFT(staff_name, 4) AS first_four_characters
FROM staff;

-- RIGHT()
SELECT staff_name, RIGHT(staff_name, 3) AS last_three_characters
FROM staff;


-- 2. MATHEMATICAL FUNCTIONS

-- ROUND()
SELECT staff_name, ROUND(salary, -3) AS rounded_salary
FROM staff;

-- CEILING()
SELECT staff_name, CEILING(salary / 10000.0) AS salary_level
FROM staff;

-- FLOOR()
SELECT staff_name, FLOOR(salary / 10000.0) AS salary_floor
FROM staff;

-- ABS()
SELECT ABS(-1250) AS positive_value;

-- POWER()
SELECT POWER(3, 2) AS calculated_power;

-- SQRT()
SELECT SQRT(144) AS square_root_value;


-- 3. DATE FUNCTIONS

-- Current date and time
SELECT GETDATE() AS system_date_time;

-- YEAR()
SELECT YEAR(GETDATE()) AS current_year;

-- MONTH()
SELECT MONTH(GETDATE()) AS current_month;

-- DAY()
SELECT DAY(GETDATE()) AS current_day;

-- DATEADD()
SELECT DATEADD(MONTH, 2, GETDATE()) AS date_after_two_months;

-- DATEDIFF()
SELECT DATEDIFF(DAY, '2026-01-01', GETDATE()) AS number_of_days;


-- 4. AGGREGATE FUNCTIONS

-- COUNT()
SELECT COUNT(*) AS staff_count
FROM staff;

-- SUM()
SELECT SUM(salary) AS salary_total
FROM staff;

-- AVG()
SELECT AVG(salary) AS average_salary
FROM staff;

-- MIN()
SELECT MIN(salary) AS lowest_salary
FROM staff;

-- MAX()
SELECT MAX(salary) AS highest_salary
FROM staff;


-- 5. ADDITIONAL FUNCTIONS

-- ISNULL()
SELECT staff_name,
       ISNULL(location, 'Location Not Available') AS staff_location
FROM staff;

-- NULLIF()
SELECT NULLIF(salary, 0) AS salary_value
FROM staff;
