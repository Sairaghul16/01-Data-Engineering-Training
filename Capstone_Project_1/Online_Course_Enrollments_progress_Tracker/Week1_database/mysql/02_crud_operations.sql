-- ============================================================
-- Week 1 | Subtask 2: CRUD operations
-- Run after 01_schema.sql
-- ============================================================
USE course_tracker;

-- ---------- CREATE: add students, courses, enrollments ----------
INSERT INTO students (name, email) VALUES
    ('Aarav Sharma', 'aarav@example.com'),
    ('Diya Iyer',    'diya@example.com'),
    ('Kabir Reddy',  'kabir@example.com');

INSERT INTO courses (title, total_lessons) VALUES
    ('Python Basics',        20),
    ('SQL Fundamentals',     18),
    ('PySpark Essentials',   22);

-- New enrollment
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
    (1, 1, '2026-09-01'),
    (1, 2, '2026-09-05'),
    (2, 1, '2026-09-02'),
    (3, 3, '2026-09-10');

-- Starting progress row for each enrollment
INSERT INTO progress (enrollment_id, lessons_completed) VALUES
    (1, 10), (2, 18), (3, 3), (4, 0);

-- ---------- READ ----------
-- All enrollments with student and course names
SELECT s.name, c.title, e.enrollment_date, e.status, p.lessons_completed
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN courses  c ON c.course_id  = e.course_id
JOIN progress p ON p.enrollment_id = e.enrollment_id;

-- ---------- UPDATE: record progress ----------
UPDATE progress SET lessons_completed = 14 WHERE enrollment_id = 1;

-- Mark enrollment completed when all lessons are done
UPDATE enrollments e
JOIN progress p ON p.enrollment_id = e.enrollment_id
JOIN courses  c ON c.course_id     = e.course_id
SET e.status = 'completed'
WHERE p.lessons_completed >= c.total_lessons;

-- Mark a student as dropped out
UPDATE enrollments SET status = 'dropped' WHERE enrollment_id = 4;

-- ---------- DELETE: remove an enrollment (child rows first) ----------
DELETE FROM progress    WHERE enrollment_id = 4;
DELETE FROM enrollments WHERE enrollment_id = 4;
