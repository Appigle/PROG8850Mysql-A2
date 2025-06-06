-- If using MySQL, create and select the database manually if needed:
CREATE DATABASE IF NOT EXISTS projectdb;
USE projectdb;

-- 1. Create the 'projects' table
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- 2. Add the 'budget' column to the 'projects' table
ALTER TABLE projects
ADD COLUMN budget DECIMAL(10, 2);


-- insert some mock data
INSERT INTO projects (project_name, start_date, end_date, budget) VALUES
('Project 1', '2024-01-01', '2024-01-31', 100000),
('Project 2', '2024-02-01', '2024-02-28', 200000),
('Project 3', '2024-03-01', '2024-03-31', 300000);

-- list the projects
SELECT * FROM projects;