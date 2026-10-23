-- ============================================================
-- Week 1 | Subtask 3: Stored procedure
-- Calculates a student's completion percentage for each course
-- (or for one course if p_course_id is given)
-- ============================================================
USE course_tracker;

DROP PROCEDURE IF EXISTS get_completion_percentage;

DELIMITER //

CREATE PROCEDURE get_completion_percentage(
    IN p_student_id INT,
    IN p_course_id  INT          -- pass NULL for all courses
)
BEGIN
    SELECT
        s.name                                                   AS student_name,
        c.title                                                  AS course_title,
        p.lessons_completed,
        c.total_lessons,
        ROUND(p.lessons_completed / c.total_lessons * 100, 2)    AS completion_percentage
    FROM enrollments e
    JOIN students s ON s.student_id    = e.student_id
    JOIN courses  c ON c.course_id     = e.course_id
    JOIN progress p ON p.enrollment_id = e.enrollment_id
    WHERE e.student_id = p_student_id
      AND (p_course_id IS NULL OR e.course_id = p_course_id);
END //

DELIMITER ;

-- Usage examples
CALL get_completion_percentage(1, NULL);   -- all courses for student 1
CALL get_completion_percentage(1, 2);      -- one course
