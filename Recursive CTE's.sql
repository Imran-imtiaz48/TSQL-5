/* =====================================================
   EMPLOYEE TABLE AND RECURSIVE CTE EXAMPLES
   ===================================================== */

-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2),
    department_id INT,
    manager_id INT
);

-- Insert sample data
INSERT INTO employees VALUES
(1, 'John', 'Doe', '2021-01-01', 50000, 1, NULL),
(2, 'Jane', 'Doe', '2021-02-15', 60000, 1, 1),
(3, 'Bob', 'Smith', '2021-03-01', 55000, 2, NULL),
(4, 'Sara', 'Johnson', '2021-04-01', 65000, 2, 3),
(5, 'Tom', 'Williams', '2021-05-01', 70000, 3, NULL),
(6, 'Emily', 'Jones', '2021-06-01', 80000, 3, 5),
(7, 'Mike', 'Brown', '2021-07-01', 75000, 4, NULL),
(8, 'Lisa', 'Davis', '2021-08-01', 85000, 4, 7),
(9, 'David', 'Wilson', '2021-09-01', 90000, 5, NULL),
(10, 'Laura', 'Taylor', '2021-10-01', 95000, 5, 9);

--------------------------------------------------
-- 1. Full Employee Hierarchy
--------------------------------------------------
WITH EmployeeHierarchy AS (
    SELECT employee_id, first_name, last_name, manager_id, 0 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, eh.level + 1
    FROM employees e
    JOIN EmployeeHierarchy eh
        ON e.manager_id = eh.employee_id
)
SELECT *
FROM Employe
