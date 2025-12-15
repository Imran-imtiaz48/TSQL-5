/* ======================================
   EMPLOYEE AND DEPARTMENT SCHEMA
   Improved Version
   ====================================== */

-- Drop tables if they already exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

--------------------------------------------------
-- Department Table
--------------------------------------------------
CREATE TABLE department (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
);

--------------------------------------------------
-- Employee Table
--------------------------------------------------
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),
    department_id INT NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES department(id)
);

--------------------------------------------------
-- Insert Data into Department
--------------------------------------------------
INSERT INTO department (id, name, location) VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'Information Technology', 'San Francisco');

--------------------------------------------------
-- Insert Data into Employee
--------------------------------------------------
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
-- Validation Queries
--------------------------------------------------
SELECT * FROM department;
SELECT * FROM employee;
