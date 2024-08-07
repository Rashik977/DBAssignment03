-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS "Assignment3".courses
(
    course_id integer NOT NULL,
    course_name character varying(100) COLLATE pg_catalog."default",
    course_description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT courses_pkey PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS "Assignment3".enrollments
(
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date,
    CONSTRAINT enrollments_pkey PRIMARY KEY (enrollment_id)
);

CREATE TABLE IF NOT EXISTS "Assignment3".students
(
    student_id integer NOT NULL,
    student_name character varying(100) COLLATE pg_catalog."default",
    student_major character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT students_pkey PRIMARY KEY (student_id)
);

ALTER TABLE IF EXISTS "Assignment3".enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id)
    REFERENCES "Assignment3".courses (course_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS "Assignment3".enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id)
    REFERENCES "Assignment3".students (student_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


-- Insert data into Students table
INSERT INTO Students (student_id, student_name, student_major) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Biology'),
(3, 'Charlie', 'History'),
(4, 'Diana', 'Mathematics');

-- Insert data into Courses table
INSERT INTO Courses (course_id, course_name, course_description) VALUES
(101, 'Introduction to CS', 'Basics of Computer Science'),
(102, 'Biology Basics', 'Fundamentals of Biology'),
(103, 'World History', 'Historical events and cultures'),
(104, 'Calculus I', 'Introduction to Calculus'),
(105, 'Data Structures', 'Advanced topics in CS');

-- Insert data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-01-15'),
(2, 2, 102, '2023-01-20'),
(3, 3, 103, '2023-02-01'),
(4, 1, 105, '2023-02-05'),
(5, 4, 104, '2023-02-10'),
(6, 2, 101, '2023-02-12'),
(7, 3, 105, '2023-02-15'),
(8, 4, 101, '2023-02-20'),
(9, 1, 104, '2023-03-01'),
(10, 2, 104, '2023-03-05');


END;