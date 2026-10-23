-- ============================================================
-- Week 1 | Subtask 5 (MySQL part): Indexes for fast search
-- ============================================================
USE course_tracker;

-- Search enrollments by student or by course
CREATE INDEX idx_enrollments_student ON enrollments (student_id);
CREATE INDEX idx_enrollments_course  ON enrollments (course_id);

-- Progress lookups by enrollment
CREATE INDEX idx_progress_enrollment ON progress (enrollment_id);

-- Search students by name
CREATE INDEX idx_students_name ON students (name);

-- Check that an index is used
EXPLAIN SELECT * FROM enrollments WHERE student_id = 1;
