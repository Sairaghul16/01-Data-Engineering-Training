#SET 5 Cleansing and RegEx

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    mobile VARCHAR(40),
    city VARCHAR(50),
    postal_code VARCHAR(20)
);
INSERT INTO registrations VALUES
(1, '  rohit sharma ', ' ROHIT@GMAIL.COM ', '+91-98765-43210', 'hyderabad
(2, 'SARA KHAN', 'sara@yahoo.com', '99887 66554', ' MUMBAI ', '400001'),
(3, '  amit   patel ', '', '(040)99887766', 'Hyderabad', '500 032'),
(4, 'Neha Singh ', NULL, '9876543210', 'BANGALORE', '560001'),
(5, 'imran ali', 'IMRAN@MAIL.COM ', '91 9988772211', NULL, '500084'),
(6, 'Priya Rao', 'priya@gmail', '98765-AB210', 'Pune', '411001');

# 1. Remove spaces around names
UPDATE registrations
SET full_name = TRIM(full_name);

# 2. Convert names to uppercase
UPDATE registrations
SET full_name = UPPER(full_name);

# 3. Convert emails to lowercase
UPDATE registrations
SET email = LOWER(TRIM(email));

# 4. Convert blank emails to NULL
UPDATE registrations
SET email = NULL
WHERE TRIM(email) = '';

# 5. Remove spaces and hyphens from mobile
UPDATE registrations
SET mobile = REPLACE(REPLACE(mobile, ' ', ''), '-', '');

# 6. Remove every non-numeric character
UPDATE registrations
SET mobile = REGEXP_REPLACE(mobile, '[^0-9]', '');

# 7. Standardize cities
UPDATE registrations
SET city = UPPER(TRIM(city));

# 8. City is NULL
SELECT *
FROM registrations
WHERE city IS NULL;

# 9. Email NULL or blank
SELECT *
FROM registrations
WHERE email IS NULL OR TRIM(email) = '';

# 10. Gmail addresses
SELECT *
FROM registrations
WHERE email REGEXP '^[A-Za-z0-9._%+-]+@gmail\\.com$';

# 11. Incorrect email format
SELECT *
FROM registrations
WHERE email IS NOT NULL
AND email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

# 12. Only numeric characters from postal code
SELECT
    registration_id,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS numeric_postal_code
FROM registrations;

# 13. Mobile numbers containing alphabets
SELECT *
FROM registrations
WHERE mobile REGEXP '[A-Za-z]';

# 14. Cleaned output
SELECT
    UPPER(TRIM(full_name)) AS name,
    NULLIF(LOWER(TRIM(email)), '') AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city
FROM registrations;

# 15. Create cleaned copy
CREATE TABLE registrations_cleaned AS
SELECT
    registration_id,
    UPPER(TRIM(full_name)) AS full_name,
    NULLIF(LOWER(TRIM(email)), '') AS email,
    REGEXP_REPLACE(mobile, '[^0-9]', '') AS mobile,
    UPPER(TRIM(city)) AS city,
    REGEXP_REPLACE(postal_code, '[^0-9]', '') AS postal_code
FROM registrations;

 












  
