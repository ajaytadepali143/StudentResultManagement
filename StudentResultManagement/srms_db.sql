CREATE DATABASE IF NOT EXISTS srms_db;
USE srms_db;

-- Users table (Admin login)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Default admin (plain password for demo: admin123)
INSERT INTO users (username, password_hash)
VALUES ('admin', 'admin123')
ON DUPLICATE KEY UPDATE password_hash = VALUES(password_hash);

-- Students table
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    semester INT
);

-- Subjects table
CREATE TABLE IF NOT EXISTS subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    max_marks INT NOT NULL
);

-- Sample subjects
INSERT INTO subjects (code, name, max_marks)
VALUES ('CS101', 'Data Structures', 100),
       ('CS102', 'Operating Systems', 100),
       ('CS103', 'DBMS', 100)
ON DUPLICATE KEY UPDATE name = VALUES(name), max_marks = VALUES(max_marks);

-- Marks table
CREATE TABLE IF NOT EXISTS marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks_obtained INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    UNIQUE (student_id, subject_id)
);
