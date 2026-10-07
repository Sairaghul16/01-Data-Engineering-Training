USE company_training;


-- 1. COUNT TOTAL STAFF
SELECT COUNT(*) AS total_staff
FROM staff;


-- 2. COUNT STAFF BY JOB ROLE
SELECT job_role,
       COUNT(*) AS staff_count
FROM staff
GROUP BY job_role;


-- 3. TOTAL SALARY OF ALL STAFF
SELECT SUM(salary) AS overall_salary
FROM staff;


-- 4. TOTAL SALARY BY JOB ROLE
SELECT job_role,
       SUM(salary) AS role_salary
FROM staff
GROUP BY job_role;


-- 5. AVERAGE SALARY
SELECT AVG(salary) AS average_pay
FROM staff;


-- 6. AVERAGE SALARY BY LOCATION
SELECT location,
       AVG(salary) AS average_pay
FROM staff
GROUP BY location;


-- 7. LOWEST SALARY BY JOB ROLE
SELECT job_role,
       MIN(salary) AS lowest_pay
FROM staff
GROUP BY job_role;


-- 8. HIGHEST SALARY BY JOB ROLE
SELECT job_role,
       MAX(salary) AS highest_pay
FROM staff
GROUP BY job_role;


-- 9. MULTIPLE AGGREGATE FUNCTIONS
SELECT job_role,
       COUNT(*) AS staff_count,
       SUM(salary) AS total_pay,
       AVG(salary) AS average_pay,
       MIN(salary) AS minimum_pay,
       MAX(salary) AS maximum_pay
FROM staff
GROUP BY job_role;


-- 10. HAVING - ROLES WITH AT LEAST 2 STAFF
SELECT job_role,
       COUNT(*) AS staff_count
FROM staff
GROUP BY job_role
HAVING COUNT(*) >= 2;


-- 11. HAVING - ROLES WITH TOTAL SALARY ABOVE 100000
SELECT job_role,
       SUM(salary) AS total_pay
FROM staff
GROUP BY job_role
HAVING SUM(salary) > 100000;


-- 12. HAVING - ROLES WITH AVERAGE SALARY ABOVE 60000
SELECT job_role,
       AVG(salary) AS average_pay
FROM staff
GROUP BY job_role
HAVING AVG(salary) > 60000;


-- 13. GROUP BY LOCATION
SELECT location,
       COUNT(*) AS staff_count,
       AVG(salary) AS average_pay
FROM staff
WHERE location IS NOT NULL
GROUP BY location;


-- 14. HAVING - LOCATIONS WITH MORE THAN ONE STAFF
SELECT location,
       COUNT(*) AS staff_count
FROM staff
WHERE location IS NOT NULL
GROUP BY location
HAVING COUNT(*) > 1;
