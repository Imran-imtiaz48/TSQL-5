/* =====================================================
   SQL COMMAND TYPES DEMONSTRATION
   DDL, DML, DCL, DQL, TCL
   ===================================================== */

--------------------------------------------------------
-- Cleanup
--------------------------------------------------------
DROP TABLE IF EXISTS employee;

--------------------------------------------------------
-- DDL (Data Definition Language)
-- Used to define or modify database objects
--------------------------------------------------------
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 0),
    department_id INT NOT NULL
);

--------------------------------------------------------
-- DML (Data Manipulation Language)
-- Used to insert, update, and delete data
--------------------------------------------------------
INSERT INTO employee (id, first_name, last_name, age, department_id)
VALUES
(1, 'John', 'Doe', 30, 1),
(2, 'Jane', 'Smith', 28, 2);

--------------------------------------------------------
-- DQL (Data Query Language)
-- Used to retrieve data
--------------------------------------------------------
SELECT * FROM employee;

--------------------------------------------------------
-- DCL (Data Control Language)
-- Used to control access and permissions
--------------------------------------------------------
-- Example only, user must exist
GRANT SELECT ON employee TO some_user;

--------------------------------------------------------
-- TCL (Transaction Control Language)
-- Used to manage transactions
--------------------------------------------------------

-- Start a transaction
BEGIN TRANSACTION;

-- Update employees in department 1
UPDATE employee
SET age = age + 1
WHERE department_id = 1;

-- Create a savepoint
SAVE TRANSACTION my_savepoint;

-- Update employees in department 2
UPDATE employee
SET age = age + 1
WHERE department_id = 2;

-- Roll back only the second update
ROLLBACK TRANSACTION my_savepoint;

-- Commit the remaining changes
COMMIT TRANSACTION;

--------------------------------------------------------
-- Final Data Check
--------------------------------------------------------
SELECT * FROM employee;
