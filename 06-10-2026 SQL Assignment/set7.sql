#SET 7 Ranking

CREATE TABLE call_performance (
    call_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    team VARCHAR(50),
    calls_handled INT,
    customer_rating DECIMAL(3,2),
    performance_date DATE
);
INSERT INTO call_performance VALUES
(1, 'Aman', 'Alpha', 42, 4.50, '2026-09-01'),
(2, 'Sara', 'Alpha', 38, 4.70, '2026-09-01'),
(3, 'Ravi', 'Beta', 50, 4.20, '2026-09-01'),
(4, 'Neha', 'Beta', 45, 4.80, '2026-09-01'),
(5, 'Aman', 'Alpha', 48, 4.60, '2026-09-02'),
(6, 'Sara', 'Alpha', 44, 4.50, '2026-09-02'),
(7, 'Ravi', 'Beta', 46, 4.30, '2026-09-02'),
(8, 'Neha', 'Beta', 52, 4.90, '2026-09-02'),
(9, 'Kabir', 'Alpha', 41, 4.40, '2026-09-01'),
(10, 'Kabir', 'Alpha', 49, 4.60, '2026-09-02'),
(11, 'Pooja', 'Beta', 45, 4.70, '2026-09-01'),
(12, 'Pooja', 'Beta', 50, 4.80, '2026-09-02'); 
  
# 1. Rank all records based on calls
SELECT *,
       RANK() OVER (ORDER BY calls_handled DESC) AS call_rank
FROM call_performance;

# 2. ROW_NUMBER
SELECT *,
       ROW_NUMBER() OVER (
           ORDER BY calls_handled DESC
       ) AS row_num
FROM call_performance;

# 3. RANK
SELECT *,
       RANK() OVER (
           ORDER BY calls_handled DESC
       ) AS rank_num
FROM call_performance;

# 4. DENSE_RANK
SELECT *,
       DENSE_RANK() OVER (
           ORDER BY calls_handled DESC
       ) AS dense_rank_num
FROM call_performance;

# 5. Compare all three
SELECT *,
       ROW_NUMBER() OVER (ORDER BY calls_handled DESC) AS row_number_rank,
       RANK() OVER (ORDER BY calls_handled DESC) AS rank_value,
       DENSE_RANK() OVER (ORDER BY calls_handled DESC) AS dense_rank_value
FROM call_performance;

# 6. Rank within each team
SELECT *,
       RANK() OVER (
           PARTITION BY team
           ORDER BY calls_handled DESC
       ) AS team_rank
FROM call_performance;

# 7. Rank by customer rating
SELECT *,
       RANK() OVER (
           ORDER BY customer_rating DESC
       ) AS rating_rank
FROM call_performance;

# 8. Top 3 records in each team
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY team
               ORDER BY calls_handled DESC
           ) AS rn
    FROM call_performance
)
SELECT *
FROM ranked
WHERE rn <= 3;

# 9. Best performance day for each agent
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY agent_name
               ORDER BY calls_handled DESC
           ) AS rn
    FROM call_performance
)
SELECT *
FROM ranked
WHERE rn = 1;

# 10. Rank agents based on total calls
WITH agent_totals AS (
    SELECT agent_name,
           SUM(calls_handled) AS total_calls
    FROM call_performance
    GROUP BY agent_name
)
SELECT *,
       RANK() OVER (
           ORDER BY total_calls DESC
       ) AS agent_rank
FROM agent_totals;
