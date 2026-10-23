-- ============================================================
-- Week 1 | Subtask 1: Create MySQL tables
-- Tables: students, courses, enrollments, progress
-- ============================================================
CREATE DATABASE IF NOT EXISTS course_tracker;
USE course_tracker;

DROP TABLE IF EXISTS progress;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id  INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE courses (
    course_id      INT PRIMARY KEY AUTO_INCREMENT,
    title          VARCHAR(150) NOT NULL,
    total_lessons  INT NOT NULL CHECK (total_lessons > 0)
);

CREATE TABLE enrollments (
    enrollment_id    INT PRIMARY KEY AUTO_INCREMENT,
    student_id       INT NOT NULL,
    course_id        INT NOT NULL,
    enrollment_date  DATE NOT NULL,
    status           ENUM('active','completed','dropped') DEFAULT 'active',
    UNIQUE (student_id, course_id),               -- a student enrolls once per course
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

CREATE TABLE progress (
    progress_id        INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id      INT NOT NULL,
    lessons_completed  INT NOT NULL DEFAULT 0,
    last_updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
);
