-- 1. CREATE DATABASE
CREATE DATABASE company_training;
USE company_training;


-- 2. CREATE STAFF TABLE
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(100),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    location VARCHAR(50)
);


-- 3. INSERT SAMPLE DATA
INSERT INTO staff
(staff_id, staff_name, job_role, salary, location)
VALUES
(201, 'Karthik Raj', 'Developer', 65000, 'Chennai'),
(202, 'Divya Kumar', 'Tester', 48000, 'Bangalore'),
(203, 'Manoj Singh', 'Developer', 72000, 'Hyderabad'),
(204, 'Swetha Rani', 'Analyst', 58000, 'Mumbai'),
(205, 'Arun Prakash', 'Developer', 85000, 'Chennai'),
(206, 'Harini Devi', 'Tester', 42000, 'Delhi'),
(207, 'Sanjay Rao', 'Analyst', 68000, 'Pune'),
(208, 'Nithya Mohan', 'Developer', 52000, NULL);


-- 4. SELECT ALL RECORDS
SELECT *
FROM staff;


-- 5. SELECT SPECIFIC COLUMNS
SELECT staff_id, staff_name, job_role
FROM staff;


-- 6. WHERE CONDITION
SELECT *
FROM staff
WHERE job_role = 'Developer';


-- 7. GREATER THAN CONDITION
SELECT *
FROM staff
WHERE salary > 60000;


-- 8. AND CONDITION
SELECT *
FROM staff
WHERE job_role = 'Developer'
  AND salary > 60000;


-- 9. OR CONDITION
SELECT *
FROM staff
WHERE job_role = 'Tester'
   OR job_role = 'Analyst';


-- 10. IN OPERATOR
SELECT *
FROM staff
WHERE location IN ('Chennai', 'Hyderabad');


-- 11. BETWEEN OPERATOR
SELECT *
FROM staff
WHERE salary BETWEEN 50000 AND 75000;


-- 12. LIKE OPERATOR
SELECT *
FROM staff
WHERE staff_name LIKE 'S%';


-- 13. IS NULL
SELECT *
FROM staff
WHERE location IS NULL;


-- 14. DISTINCT
SELECT DISTINCT job_role
FROM staff;


-- 15. ALIAS
SELECT staff_name AS employee,
       salary AS annual_salary
FROM staff;


-- 16. ORDER BY ASCENDING
SELECT *
FROM staff
ORDER BY salary ASC;


-- 17. ORDER BY DESCENDING
SELECT *
FROM staff
ORDER BY salary DESC;


-- 18. LESS THAN CONDITION
SELECT *
FROM staff
WHERE salary < 50000;


-- 19. NOT EQUAL CONDITION
SELECT *
FROM staff
WHERE job_role <> 'Developer';


-- 20. MULTIPLE CONDITIONS
SELECT *
FROM staff
WHERE salary >= 50000
  AND location IS NOT NULL;
