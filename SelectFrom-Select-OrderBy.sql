USE classicmodels;
-- SELECT FROM
-- 2. Retrieve the last names of all employees
SELECT lastName FROM employees;

-- 2.  Retrieve the first name, last name, and job title of employees: 
SELECT firstName, lastName, jobTitle
FROM employees;


-- SELECT 
--  3. the following statement uses the NOW() function in the SELECT statement to return the current date and time of the server where MySQL server is running:
 SELECT now() AS "current_time";
 
 -- he NOW() function doesn’t have any parameters. To call it, you place the parentheses () after the function name.
 
 -- 4. If a function has parameters, you need to pass arguments into it. For example, to concatenate multiple strings into a single string, you can use the CONCAT() function:
 
 SELECT CONCAT('John',' ','Doe') AS "Full Name";
 
-- By default, MySQL uses the expression specified in the SELECT clause as the column name of the result set. To change a column name of the result set, you can use a column alias.


-- ORDER BY

-- By default, the ORDER BY clause uses ASC if you don’t explicitly specify any option. Therefore, the following ORDER BY clauses are equivalent:
-- ORDER BY column1 ASC;
-- ORDER BY column1 ;

-- 5. Retrieve the first name and last name of all customers, sort the customers by their last names in ascending order. 
SELECT contactFirstName, contactLastName
FROM customers
ORDER BY contactLastName;

-- 6. Retrieve the first name and last name of all customers, sort the customers by their last names in descending order. 
SELECT contactFirstName, contactLastName
FROM customers
ORDER BY contactLastName DESC;

-- 6. Retrieve the first name and last name of all customers, sort the customers by the last name in descending order and then by the first name in ascending order. 
SELECT contactFirstName, contactLastName
FROM customers
ORDER BY contactLastName DESC,
		contactFirstName;
        
-- 7. selects the order line items from the orderdetails table. It calculates the subtotal for each line item and sorts the result set based on the subtotal from high to low.
SELECT orderNumber,
		productCode,
        quantityOrdered * priceEach AS Subtotal,
        orderLineNumber
FROM orderdetails
ORDER BY Subtotal  DESC; 

-- The FIELD() function returns the index (position) of a value within a list of values.
-- Here’s the syntax of the FIELD() function:
  -- FIELD(value, value1, value2, ...)
-- In this syntax:
	-- value: The value for which you want to find the position.
	-- value1, value2, ...: A list of values against which you want to compare the specified value.
-- The FIELD() function returns the position of the value in the list of values value1, value2, and so on.

-- If the value is not found in the list, the FIELD() function returns 0.

SELECT FIELD('A', 'A', 'B','C');
SELECT FIELD('B', 'A','B','C');

-- 8.  Suppose that you want to sort the sales orders based on their statuses in the following order:
		-- In Process
		-- On Hold
		-- Canceled
		-- Resolved
		-- Disputed
		-- Shipped
	-- To do this, you can use the FIELD() function to map each order status to a number and sort the result by the result of the FIELD() function:
	SELECT orderNumber, status
    FROM orders
    ORDER BY field(status, 'In Process', 'On Hold', 'Cancelled', 'Resolved', 'Disputed', 'Shipped');


-- In MySQL, NULL comes before non-NULL values. Therefore, when you the ORDER BY clause with the ASC option, NULLs appear first in the result set. Eg.
SELECT
  firstName, 
  lastName, 
  reportsTo 
FROM 
  employees 
ORDER BY 
  reportsTo;
 
-- However, if you use the ORDER BY with the DESC option, NULLs will appear last in the result set. For example:
  SELECT 
  firstName, 
  lastName, 
  reportsTo 
FROM 
  employees 
ORDER BY 
  reportsTo DESC;
 