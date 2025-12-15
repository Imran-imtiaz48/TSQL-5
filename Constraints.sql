/* ==========================================
   SQL CONSTRAINTS DEMO
   NOT NULL, DEFAULT, UNIQUE, PRIMARY KEY,
   FOREIGN KEY, CHECK
   ========================================== */

-- Drop tables if they already exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

--------------------------------------------------
-- Department Table with Constraints
--------------------------------------------------
CREATE TABLE department (
    dept_id INT PRIMARY KEY,                     -- PRIMARY KEY
    name VARCHAR(50) NOT NULL UNIQUE,             -- NOT NULL + UNIQUE
    state VARCHAR(50) NOT NULL DEFAULT 'Unknown'  -- NOT NULL + DEFAULT
);

--------------------------------------------------
-- Employee Table with Constraints
--------------------------------------------------
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,                  -- PRIMARY KEY
    first_name VARCHAR(50) NOT NULL,               -- NOT NULL
    last_name VARCHAR(50) NOT NULL,                -- NOT NULL
    hire_date DATE NOT NULL DEFAULT GETDATE(),     -- DEFAULT
    salary NUMERIC(10,2) NOT NULL CHECK (salary > 0), -- CHECK
    department_id INT NOT NULL,                    -- NOT NULL

    -- UNIQUE constraint on full name
    CONSTRAINT uc_employee_name UNIQUE (first_name, last_name),

    -- FOREIGN KEY constraint
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES department(dept_id)
);

--------------------------------------------------
-- Sample Data Insert
--------------------------------------------------
INSERT INTO department (dept_id, name, state) VALUES
(1, 'Sales', 'New York'),
(2, 'IT', 'California'),
(3, 'HR', DEFAULT);

INSERT INTO employee (employee_id, first_name, last_name, salary, department_id) VALUES
(1, 'John', 'Doe', 50000, 1),
(2, 'Jane', 'Smith', 60000, 2),
(3, 'Mike', 'Brown', 55000, 3);

--------------------------------------------------
-- Validation Queries
--------------------------------------------------
SELECT * FROM department;
SELECT * FROM employee;
