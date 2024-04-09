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
    UNIQUE(username, email)
);
