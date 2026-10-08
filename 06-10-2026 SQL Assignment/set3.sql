#SET 3 JOIN

# 1. Student name and course name
SELECT s.student_name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

# 2. Student, city, course and fee
SELECT s.student_name, s.city, c.course_name, c.fee
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

# 3. Students enrolled in Data Engineering
SELECT s.student_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Engineering';

# 4. All students including no enrollment
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

# 5. Students who never enrolled
SELECT s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

# 6. All courses including no students
SELECT c.course_name, s.student_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON e.student_id = s.student_id;

# 7. Courses having no enrollments
SELECT c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

# 8. Enrollment records with no valid student
SELECT e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

# 9. Enrollment records with no valid course
SELECT e.*
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

# 10. Total courses taken by each student
SELECT s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;

 
#11 Total fees for each enrollments
SELECT s.student_name, COALESCE(SUM(c.fee), 0) AS total_fees
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.student_id, s.student_name;


#12. Students enrolled in more than one course
SELECT s.student_name, COUNT(e.course_id) AS course_count
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1;

# 13. Courses having more than one student
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) > 1;

# 14. Total enrollment revenue by course
SELECT c.course_name, SUM(c.fee) AS total_revenue
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

# 15. Course generating highest revenue
SELECT c.course_name, SUM(c.fee) AS total_revenue
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_revenue DESC
LIMIT 1;
