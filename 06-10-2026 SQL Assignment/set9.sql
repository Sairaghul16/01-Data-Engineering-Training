#Set 9 — Hierarchical Queries

  CREATE TABLE staff_hierarchy (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    manager_id INT,
    designation VARCHAR(100)
);
INSERT INTO staff_hierarchy VALUES
(1, 'Raj Malhotra', NULL, 'CEO'),
(2, 'Meera Shah', 1, 'CTO'),
(3, 'Vikram Rao', 1, 'Sales Director'),
(4, 'Aman Khan', 2, 'Engineering Manager'),
(5, 'Sara Ali', 2, 'Data Manager'),
(6, 'Rohit Das', 4, 'Developer'),
(7, 'Priya Singh', 4, 'Developer'),
(8, 'Kabir Ahmed', 5, 'Data Engineer'),
(9, 'Neha Rao', 5, 'Data Analyst'),
(10, 'Imran Sheikh', 3, 'Sales Manager'),
(11, 'Pooja Jain', 10, 'Sales Executive');


# 1. Employees having no manager
SELECT *
FROM staff_hierarchy
WHERE manager_id IS NULL;

# 2. Direct reports of CEO
SELECT e.*
FROM staff_hierarchy e
JOIN staff_hierarchy m
ON e.manager_id = m.employee_id
WHERE m.employee_name = 'Raj Malhotra';

# 3. Direct reports of CTO
SELECT e.*
FROM staff_hierarchy e
JOIN staff_hierarchy m
ON e.manager_id = m.employee_id
WHERE m.employee_name = 'Meera Shah';

# 4. Complete hierarchy using recursive CTE
WITH RECURSIVE hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        designation,
        0 AS hierarchy_level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.designation,
        h.hierarchy_level + 1
    FROM staff_hierarchy e
    JOIN hierarchy h
      ON e.manager_id = h.employee_id
)
SELECT *
FROM hierarchy;

# 5. Hierarchy with level
WITH RECURSIVE hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        designation,
        0 AS level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.designation,
        h.level + 1
    FROM staff_hierarchy e
    JOIN hierarchy h
      ON e.manager_id = h.employee_id
)
SELECT *
FROM hierarchy
ORDER BY level, employee_id;


# 6. Everyone working below Meera Shah
WITH RECURSIVE subordinates AS (
    SELECT *
    FROM staff_hierarchy
    WHERE manager_id = (
        SELECT employee_id
        FROM staff_hierarchy
        WHERE employee_name = 'Meera Shah'
    )

    UNION ALL

    SELECT e.*
    FROM staff_hierarchy e
    JOIN subordinates s
      ON e.manager_id = s.employee_id
)
SELECT *
FROM subordinates;

# 7. Everyone working below Aman Khan
WITH RECURSIVE subordinates AS (
    SELECT *
    FROM staff_hierarchy
    WHERE manager_id = (
        SELECT employee_id
        FROM staff_hierarchy
        WHERE employee_name = 'Aman Khan'
    )

    UNION ALL

    SELECT e.*
    FROM staff_hierarchy e
    JOIN subordinates s
      ON e.manager_id = s.employee_id
)
SELECT *
FROM subordinates;

# 8. Employee -> Manager relationships
SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM staff_hierarchy e
LEFT JOIN staff_hierarchy m
ON e.manager_id = m.employee_id;


# 9. Number of employees at each hierarchy level
WITH RECURSIVE hierarchy AS (
    SELECT employee_id, manager_id, 0 AS level
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.manager_id, h.level + 1
    FROM staff_hierarchy e
    JOIN hierarchy h
      ON e.manager_id = h.employee_id
)
SELECT level, COUNT(*) AS employee_count
FROM hierarchy
GROUP BY level
ORDER BY level;

# 10. Organization from CEO downward
WITH RECURSIVE hierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        designation,
        CAST(employee_name AS CHAR(500)) AS hierarchy_path
    FROM staff_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.designation,
        CONCAT(h.hierarchy_path, ' -> ', e.employee_name)
    FROM staff_hierarchy e
    JOIN hierarchy h
      ON e.manager_id = h.employee_id
)
SELECT *
FROM hierarchy;


