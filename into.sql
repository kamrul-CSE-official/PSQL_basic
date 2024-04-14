-- Active: 1712571129820@@127.0.0.1@5432@test3
-- #Create Database
CREATE DATABASE test3

-- #Create table 
CREATE TABLE student (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1,2)
)

-- #Update a table name
ALTER TABLE student RENAME TO learners;

-- #Delete a table
DROP TABLE learners;

-- # Delete all rows in a table without deleting the table
TRUNCATE TABLE user1

-- #Create a table with CONSTRAINTS
CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INT DEFAULT 18
)

-- #Insert value
INSERT INTO users VALUES(1, 'ABC', 'abc@gmail.com')

-- # See all data form table
SELECT * from users

-- # See a single col in table 
SELECT age from users

-- #Create a table
CREATE TABLE user1 (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    UNIQUE(username, email),
    age INT DEFAULT 18
);

--  # Insert data into table 
INSERT INTO user1 (user_id, username, email) VALUES (1, 'MD.Kamrul Hasan', 'kamrul@gamil.com');

SELECT * from user1

-- # multiple value insert into table
INSERT INTO user1 (username, email) VALUES 
    ('Jamal Khan', 'jamal@gmail.com'), 
    ('Asif Mia', 'asif@gmail.com');

SELECT * FROM user1;

-- # Another way to insert into table
INSERT INTO user1 VALUES 
    (1, 'Jamal Khan', 'jamal@gmail.com'), 
    (2, 'Asif Mia', 'asif@gmail.com');

SELECT * FROM user1;

--  # Alter table
-- 1. Add a colum, drop a cloum, chage datatype of a colum 
-- 2. Rename a column, set DEFAULT value for a COLUMN
-- 3. add CONSTRAINT to a COLUMN, drop CONSTRANT for a column
-- 4. table rename
-- ALTER TABLE table_name action


-- # Add a column
ALTER table user1
add COLUMN password VARCHAR(255) DEFAULT 'admin123' NOT NULL;

ALTER Table user1 
ADD COLUMN age INT DEFAULT 18 NOT NULL;

-- # Delete a column
ALTER TABLE user1
DROP COLUMN age;

-- # Change column data type
ALTER TABLE user1 ADD COLUMN demo INT;

ALTER TABLE user1 ALTER COLUMN demo TYPE TEXT;

ALTER TABLE user1 ALTER COLUMN demo SET DEFAULT 'Bangladesh';

INSERT INTO user1 (username, email) VALUES ('Hasan', 'hasan@gmail.com');

SELECT * FROM user1;

-- # COLUMN rename
ALTER TABLE user1
    RENAME COLUMN demo to counter;

-- # Add constant
ALTER TABLE user1 ALTER COLUMN country SET DEFAULT 'Bangladesh';

ALTER TABLE user1 ALTER COLUMN country SET NOT NULL;

ALTER TABLE user1 
    ADD CONSTRAINT unique_email UNIQUE (email);

--  # DROP constraint
ALTER TABLE user1
    DROP CONSTRAINT unique_email;

--  # Foreign key constraint (একটা টেবিল থেকে আরেকটা টেবিলে ফরেন কী রাখলে যদি কোন কিছু ডিলেট করা হয় তখন এরর দিবে কারন উক্ত টেবিলের pk অন্য টেবিলে fk)
-- 1.Employ table
-- 2.Department table
-- Each employment velongs to a department

CREATE TABLE Department (
    deptID SERIAL PRIMARY KEY,
    deptName VARCHAR(255)
);

INSERT INTO Department (deptName) VALUES ('IT');

DELETE FROM Department WHERE deptID = 1;

SELECT * FROM Department


CREATE TABLE Employee(
    empID SERIAL PRIMARY KEY,
    empName VARCHAR(255) NOT NULL,
    departmentID INT,
    CONSTRAINT fk_constraint_dept
        FOREIGN KEY (departmentID)
        REFERENCES Department(deptID)
)


INSERT INTO Employee (empName, departmentID) VALUES ('Muktadir', 1);

DELETE FROM Employee WHERE empID = 1;

SELECT * FROM Employee;


CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_date DATE
)

SELECT * FROM courses;

-- Date: YYYY-MM-DD
INSERT INTO
    courses(course_name, description, published_date)
VALUES
    ('PostgreSQL for Developers', 'A complete postgreSQL for developers', '2020-07-13'),
    ('PostgreSQL Administration', 'A complete postgreSQL Guide for DBA', NULL),
    ('PostgreSQL High Performance', NULL, NULL),
    ('PostgreSQL Bootcamp', 'Learn postgresSQL', '2012-02-26');

    -- # Update database table row
    UPDATE courses
    ??
    WHERE 
