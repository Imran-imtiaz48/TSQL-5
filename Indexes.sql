/* =====================================================
   SQL SERVER INDEXES DEMO
   ===================================================== */

-- Drop tables if they exist for safe re-execution
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

--------------------------------------------------
-- 1. Create Department Table
--------------------------------------------------
CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

INSERT INTO department (id, name, location) VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'Information Technology', 'San Francisco');

--------------------------------------------------
-- 2. Create Employee Table
--------------------------------------------------
CREATE TABLE employee (
    id INT PRIMARY KEY,                      -- Clustered index by default
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT NOT NULL
);

INSERT INTO employee (id, first_name, last_name, hire_date, salary, department_id) VALUES
(1, 'John', 'Doe', '2021-01-01', 50000, 1),
(2, 'Jane', 'Doe', '2021-02-15', 60000, 1),
(3, 'Bob', 'Smith', '2021-03-01', 55000, 2),
(4, 'Sara', 'Johnson', '2021-04-01', 65000, 2),
(5, 'Tom', 'Williams', '2021-05-01', 70000, 3),
(6, 'Emily', 'Jones', '2021-06-01', 80000, 3),
(7, 'Mike', 'Brown', '2021-07-01', 75000, 4),
(8, 'Lisa', 'Davis', '2021-08-01', 85000, 4),
(9, 'David', 'Wilson', '2021-09-01', 90000, 5),
(10, 'Laura', 'Taylor', '2021-10-01', 95000, 5);

--------------------------------------------------
-- 3. Indexes
--------------------------------------------------

-- Clustered Index
-- There can only be one clustered index per table. 
-- Usually, the primary key column automatically has a clustered index.
-- Example: Explicit clustered index on 'id' (optional if PRIMARY KEY already exists)
CREATE UNIQUE CLUSTERED INDEX idx_employee_id
ON employee(id);

-- Non-Clustered Index
-- Speeds up queries filtering or joining on first_name and last_name
CREATE NONCLUSTERED INDEX idx_employee_name
ON employee(first_name, last_name);

-- Another Non-Clustered Index
-- Useful for queries filtering on department_id and salary
CREATE NONCLUSTERED INDEX idx_employee_dept_salary
ON employee(department_id, salary);

--------------------------------------------------
-- 4. Query Example Using Indexes
--------------------------------------------------
-- This query can benefit from the employee_name_index
SELECT * 
FROM employee
WHERE first_name = 'John' AND last_name = 'Doe';

-- This query can benefit from the employee_department_salary_index
SELECT *
FROM employee
WHERE department_id = 3 AND salary > 75000;
