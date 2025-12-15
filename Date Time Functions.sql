/* ===============================================
   SQL SERVER DATE FUNCTIONS DEMO
   =============================================== */

--------------------------------------------------
-- 1. GETDATE(): Returns the current date and time
--------------------------------------------------
SELECT GETDATE() AS CurrentDateTime;

--------------------------------------------------
-- 2. DATEDIFF(): Difference between two dates
-- Syntax: DATEDIFF(interval, start_date, end_date)
--------------------------------------------------
-- Difference in years
SELECT DATEDIFF(year, '2001-06-17', GETDATE()) AS YearsDifference;

-- Difference in months
SELECT DATEDIFF(month, '2001-06-17', '2023-04-22') AS MonthsDifference;

-- Difference in days
SELECT DATEDIFF(day, '2001-06-17', '2023-04-22') AS DaysDifference;

--------------------------------------------------
-- 3. DATEADD(): Add or subtract interval from a date
-- Syntax: DATEADD(interval, number, date)
--------------------------------------------------
-- Add 7 days
SELECT DATEADD(day, 7, '2023-06-17') AS DatePlus7Days;

-- Subtract 7 days
SELECT DATEADD(day, -7, '2023-06-17') AS DateMinus7Days;

--------------------------------------------------
-- 4. DATEPART(): Extract a part of the date
-- Syntax: DATEPART(part, date)
--------------------------------------------------
SELECT DATEPART(year, '2021-04-15') AS YearPart;
SELECT DATEPART(month, '2021-04-15') AS MonthPart;
SELECT DATEPART(day, '2021-04-15') AS DayPart;

--------------------------------------------------
-- 5. CONVERT(): Convert date to string in different formats
-- Syntax: CONVERT(datatype, expression, style)
--------------------------------------------------
-- Convert to yyyy-mm-dd format
SELECT CONVERT(varchar, GETDATE(), 23) AS DateYYYYMMDD;

--------------------------------------------------
-- 6. ISDATE(): Check if a string is a valid date
--------------------------------------------------
SELECT ISDATE('2021-04-15') AS IsValidDate; -- Returns 1
SELECT ISDATE('hello') AS IsValidDate;      -- Returns 0

--------------------------------------------------
-- 7. DATENAME(): Returns name of month, day, or week
-- Syntax: DATENAME(part, date)
--------------------------------------------------
SELECT DATENAME(month, '2021-04-15') AS MonthName;  -- 'April'

--------------------------------------------------
-- 8. DAY(), MONTH(), YEAR(): Extract specific parts
--------------------------------------------------
SELECT DAY('2023-06-17') AS DayOfMonth;
SELECT MONTH('2023-06-17') AS MonthNumber;
SELECT YEAR('2023-06-17') AS YearNumber;
