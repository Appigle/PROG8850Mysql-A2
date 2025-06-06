-- If using MySQL, create and select the database manually if needed:
CREATE DATABASE IF NOT EXISTS companydb;
USE companydb;

-- Create the 'departments' table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

-- insert some mock data
INSERT INTO departments (department_name, location) VALUES
('HR', 'New York'),
('IT', 'San Francisco'),
('Finance', 'London');

-- list the departments
SELECT * FROM departments;  