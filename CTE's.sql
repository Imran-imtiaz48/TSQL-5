/* ================================
   COMPLETE SQL SCRIPT
   Employees, Departments, CTEs
   ================================ */

-- Drop tables if they already exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

--------------------------------------------------
-- 1) Create Departments Table
--------------------------------------------------
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

--------------------------------------------------
-- 2) Create Employees Table
--------------------------------------------------
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    department_id INT NOT NULL,
    manager_id INT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

--------------------------------------------------
-- 3) Insert Data into Departments
--------------------------------------------------
INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'Information Technology', 'San Francisco');

--------------------------------------------------
-- 4) Insert Data into Employees
--------------------------------------------------
INSERT INTO employees (employee_id, first_name, last_name, hire_date, salary, department_id, manager_id) VALUES
(1, 'John', 'Doe', '2021-01-01', 50000, 1, NULL),
(2, 'Jane', 'Doe', '2021-02-15', 60000, 1, 1),
(3, 'Bob', 'Smith', '2021-03-01', 55000, 2, 1),
(4, 'Sara', 'Johnson', '2021-04-01', 65000, 2, 2),
(5, 'Tom', 'Williams', '2021-05-01', 70000, 3, 2),
(6, 'Emily', 'Jones', '2021-06-01', 80000, 3, 3),
(7, 'Mike', 'Brown', '2021-07-01', 75000, 4, 3),
(8, 'Lisa', 'Davis', '2021-08-01', 85000, 4, 4),
(9, 'David', 'Wilson', '2021-09-01', 90000, 5, 4),
(10, 'Laura', 'Taylor', '2021-10-01', 95000, 5, 5);

--------------------------------------------------
-- 5) Basic CTE
-- Employees with Department Names
--------------------------------------------------
WITH employee_department AS (
    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        d.department_name
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
)
SELECT *
FROM employee_department;

--------------------------------------------------
-- 6) Aggregation CTE
-- Total Salary per Department
--------------------------------------------------
WITH department_salary AS (
    SELECT
        d.department_name,
        SUM(e.salary) AS total_salary
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT *
FROM department_salary
ORDER BY total_salary DESC;

--------------------------------------------------
-- 7) Multiple Aggregations Using One CTE
-- Highest and Lowest Salary per Department
--------------------------------------------------
WITH department_salary_stats AS (
    SELECT
        d.department_name,
        MAX(e.salary) AS highest_salary,
        MIN(e.salary) AS lowest_salary
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    GROUP BY d.department_name
)
SELECT *
FROM department_salary_stats;

--------------------------------------------------
-- 8) Recursive CTE
-- Employee Hierarchy
--------------------------------------------------
WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        manager_id,
        0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.first_name,
        e.last_name,
        e.manager_id,
        eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT *
FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;
