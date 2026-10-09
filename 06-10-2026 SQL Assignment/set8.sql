#SET 8 — CTE + Correlated Subqueries

CREATE TABLE insurance_claims (
    claim_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    insurance_type VARCHAR(50),
    claim_amount DECIMAL(12,2),
    branch VARCHAR(50)
);
INSERT INTO insurance_claims VALUES
(1, 'Ajay Kumar', 'Health', 75000, 'Hyderabad'),
(2, 'Meena Shah', 'Motor', 45000, 'Mumbai'),
(3, 'Rohit Jain', 'Health', 125000, 'Hyderabad'),
(4, 'Sara Ali', 'Travel', 30000, 'Delhi'),
(5, 'Vikas Rao', 'Motor', 85000, 'Mumbai'),
(6, 'Nisha Singh', 'Health', 60000, 'Delhi'),
(7, 'Imran Khan', 'Travel', 55000, 'Hyderabad'),
(8, 'Pooja Patel', 'Motor', 40000, 'Delhi'),
(9, 'Karan Mehta', 'Health', 150000, 'Mumbai'),
(10, 'Farah Ahmed', 'Travel', 35000, 'Hyderabad');

# 1. Total claims by insurance type
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *
FROM claim_totals;

# 2. Total claims by branch
WITH branch_totals AS (
    SELECT branch,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY branch
)
SELECT *
FROM branch_totals;

# 3. Insurance types above 200000
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *
FROM claim_totals
WHERE total_claims > 200000;

#  4. Claims above overall average
WITH avg_claim AS (
    SELECT AVG(claim_amount) AS average_claim
    FROM insurance_claims
)
SELECT *
FROM insurance_claims
WHERE claim_amount > (
    SELECT average_claim
    FROM avg_claim
);


# 5. Rank insurance types
WITH claim_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
)
SELECT *,
       RANK() OVER (ORDER BY total_claims DESC) AS claim_rank
FROM claim_totals;

# 6. Two CTEs
WITH type_totals AS (
    SELECT insurance_type,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY insurance_type
),
branch_totals AS (
    SELECT branch,
           SUM(claim_amount) AS total_claims
    FROM insurance_claims
    GROUP BY branch
)
SELECT *
FROM type_totals
CROSS JOIN branch_totals;


# 7. Claims above average for their insurance type
SELECT *
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.insurance_type = ic.insurance_type
);

# 8. Claims above branch average
SELECT *
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.branch = ic.branch
);

# 9. Largest claim for each insurance type
SELECT *
FROM insurance_claims ic
WHERE claim_amount = (
    SELECT MAX(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.insurance_type = ic.insurance_type
);

# 10. Customers above branch average
SELECT customer_name, branch, claim_amount
FROM insurance_claims ic
WHERE claim_amount > (
    SELECT AVG(ic2.claim_amount)
    FROM insurance_claims ic2
    WHERE ic2.branch = ic.branch
);
