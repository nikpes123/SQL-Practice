-- The WHERE clause allows you to specify a search condition for the rows returned by a query.
-- The search_condition is a combination of one or more expressions using the logical operator AND, OR and NOT.
-- In MySQL, a predicate is a Boolean expression that evaluates to TRUE, FALSE, or UNKNOWN.
-- The SELECT statement will include any row that satisfies the search_condition in the result set.
 -- Besides the SELECT statement, you can use the WHERE clause in the UPDATE or DELETE statement to specify which rows to update or delete.
 USE classicmodels;
-- Using  employees db
 -- 1. find all employees whose job titles are Sales Rep:
 SELECT firstName, lastName, jobTitle
 FROM employees
 WHERE jobTitle = "Sales Rep";
 
 -- 2. find employees whose job titles are Sales Rep and office codes are 1
 SELECT firstName, lastName, jobTitle, officeCode
 FROM employees
 WHERE jobTitle = "Sales Rep" and officeCode = 1;

-- 3.  finds employees whose job title is Sales Rep or employees who locate the office with office code 1, order them by officeCode and jobTitle in ascending order
  SELECT firstName, lastName, jobTitle, officeCode
 FROM employees
 WHERE jobTitle = "Sales Rep" OR officeCode = 1
 ORDER BY officeCode, jobTitle;


-- The BETWEEN operator returns TRUE if a value is in a range of values:
-- 4. find employees who are located in offices whose office code is from 1 to 3:
SELECT firstName, lastName, officeCode
FROM employees
WHERE officeCode BETWEEN 1 AND 3;

-- The LIKE operator evaluates to TRUE if a value matches a specified pattern.
-- To form a pattern, you use the % and _ wildcards. The % wildcard matches any string of zero or more characters while the _ wildcard matches any single character.
-- 5. find the employees whose last names end with the string 'son'
SELECT firstName, lastName
FROM employees
WHERE lastName LIKE "%son";

-- The IN operator returns TRUE if a value matches any value in a list.
 -- 6. find employees who are located in the offices with the codes 1, 2, and 3:
 SELECT firstName, lastName, officeCode
 FROM employees
 WHERE officeCode IN (1, 2, 3);
 
-- To check if a value is NULL or not, you use the IS NULL operator, not the equal operator (=). The IS NULL operator returns TRUE if a value is NULL.
-- In the database world, NULL is a marker that indicates that a value is missing or unknown. NULL is not equivalent to the number 0 or an empty string. 

-- 7. get the rows with the values in the reportsTo column are NULL:
SELECT firstName, lastName, reportsTo
FROM employees
WHERE reportsTo IS NULL;


-- The following table shows the comparison operators that you can use to form the expression in the WHERE clause.
	--  =	Equal to. You can use it with almost any data type.
    -- <> or !=	Not equal to
    -- <	Less than. You typically use it with numeric and date/time data types.
    -- >	Greater than.
    -- <=	Less than or equal to
    -- >=	Greater than or equal to
    
-- 8.  find all employees who are not the Sales Rep:
SELECT firstName, lastName, jobTitle
FROM employees
WHERE jobTitle <> "Sales Rep";

-- 9.  find employees whose office code is greater than 5:
SELECT firstName, lastName, officeCode
FROM employees
WHERE officeCode > 5;

-- 10. find all employees with office code less than or equal to 4 
SELECT firstName, lastName, officeCode
FROM employees
WHERE officeCode <= 4;