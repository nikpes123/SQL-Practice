-- MySQL BETWEEN (https://www.mysqltutorial.org/mysql-basics/mysql-between/)
--  The BETWEEN operator is a logical operator that specifies whether a value is in a range or not. Here’s the syntax of the BETWEEN operator: value BETWEEN low AND high;
--  The BETWEEN operator returns 1 if: value >= low AND value <= high. Otherwise, it returns 0.
-- If the value, low, or high is NULL, the BETWEEN operator returns NULL .


-- NOT BETWEEN
-- To negate the BETWEEN operator, you use the NOT operator: value NOT BETWEEN low AND high
-- The NOT BETWEEN operator returns 1 if: value < low OR value > high. Otherwise, it returns 0.
USE classicmodels;
-- 1.  find products whose buy prices between 90 and 100:
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice BETWEEN 90 AND 100;

-- 2. find the products whose buy prices are not between $20 and $100,
 SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice NOT BETWEEN 20 AND 100;

-- 3. You can rewrite the query above using the less than (<), greater than (>), and the logical operator (AND) like this:
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;



-- To check if a value is between a date range, you should explicitly cast the value to the DATE type.

 -- 4. retreive the orders with the required dates between 01/01/2003 to 01/31/2003:
SELECT orderNumber, requiredDate
FROM orders
WHERE requiredDate BETWEEN CAST("2003-01-01" AS DATE) AND CAST("2003-01-31" AS DATE);


-- -----------------------------------------------------------------------------------------------
-- MySQL LIKE (https://www.mysqltutorial.org/mysql-basics/mysql-like/)
-- The LIKE operator is a logical operator that tests whether a string contains a specified pattern or not.
-- Here’s the syntax of the LIKE operator: expression LIKE pattern ESCAPE escape_character
-- In this syntax, if the expression matches the pattern, the LIKE operator returns 1. Otherwise, it returns 0.

-- MySQL provides two wildcard characters for constructing patterns: Percentage % and underscore _ .

-- 	The percentage ( % ) wildcard matches any string of zero or more characters.
-- 	The underscore ( _ ) wildcard matches any single character. 


-- For example, s% matches any string starting with the character s such as sun and six. The se_ matches any string starting with  se and is followed by any character such as see and sea.
-- When the pattern contains the wildcard character and you want to treat it as a regular character, you can use the ESCAPE clause.

-- 1.  find employees whose first names start with the letter a:
SELECT firstName, lastName
FROM employees
WHERE firstName LIKE "a%";

-- 2. find employees whose last names end with the literal string on e.g., Patterson, Thompson:
SELECT firstName, lastName
FROM employees
WHERE lastName LIKE "%on"; 

-- 3. find all employees whose last names contain the substring on: 
SELECT firstName, lastName
FROM employees
WHERE lastName LIKE "%on%"; 

-- 4. To find employees whose first names start with the letter T , end with the letter m, and contain any single character between e.g., Tom , Tim, you use the underscore (_) wildcard to construct the pattern as follows:
 SELECT firstName, lastName
FROM employees
WHERE firstName LIKE "T_m"; 


-- The MySQL allows you to combine the NOT operator with the LIKE operator to find a string that does not match a specific pattern.
-- 5.  search for employees whose last names don’t start with the letter B
SELECT firstName, lastName
FROM employees
WHERE lastName NOT LIKE "B%"; 

-- Note that the pattern is not case-sensitive. Therefore, the b% and B% patterns return the same result.
 
 
 
 -- Sometimes the pattern may contain the wildcard characters e.g., 10%, _20, etc. 
 -- In this case, you can use the ESCAPE clause to specify the escape character so that the LIKE operator interprets the wildcard character as a literal character.
 -- If you don’t specify the escape character explicitly, the backslash character (\) is the default escape character.
-- 6.  find products whose product codes contain the string _20 , you can use the pattern %\_20% with the default escape character:
SELECT productCode, productName
FROM products
WHERE productCode LIKE "%\_20%";  -- try without the \ and see output

-- Alternatively, you can specify a different escape character e.g., $ using the ESCAPE clause:
SELECT productCode, productName
FROM products
WHERE productCode LIKE "%+_20%" ESCAPE "+"; 



-- -------------------------------------------------------------------------------------------------
-- MySQL LIMIT (https://www.mysqltutorial.org/mysql-basics/mysql-limit/)
-- The LIMIT clause is used in the SELECT statement to constrain the number of rows to return. The LIMIT clause accepts one or two arguments. The values of both arguments must be zero or positive integers.
-- The following illustrates the LIMIT clause syntax with two arguments:
-- 	SELECT 
-- 		select_list
-- 	FROM
-- 		table_name
-- 	LIMIT [offset,] row_count;

-- In LIMIT [offset,] row_count, the offset means:
-- 👉 How many rows to skip before starting to return data.

-- EG. 
SELECT * FROM products LIMIT 5, 10;
-- Offset = 5 → skip the first 5 rows.
-- Row count = 10 → return the next 10 rows (i.e., rows 6 to 15).

-- When you use the LIMIT clause with one argument, MySQL will use this argument to determine the maximum number of rows to return from the first row of the result set.
-- Therefore, these two clauses are equivalent: LIMIT row_count; And LIMIT 0 , row_count;

-- 7.  get the top five customers who have the highest credit:
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 5;
-- 8. find five customers who have the lowest credits:
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit
LIMIT 5;
-- Because there are more than 5 customers that have credits zero, the result of the query above may lead to an inconsistent result. 

-- To fix this issue, you need to add more columns to the ORDER BY clause to constrain the row in unique order:
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit, customerNumber
LIMIT 5;


-- This query uses the COUNT(*) aggregate function to get the total rows from the customers table:
SELECT COUNT(*)
FROM customers;

-- get rows of page 1 which contains the first 10 customers sorted by the customer name:
SELECT customerNumber, customerName
FROM customers
ORDER BY customerName
LIMIT 10;

-- get the rows of the second page that include rows 11 – 20:
SELECT customerNumber, customerName
FROM customers
ORDER BY customerName
LIMIT 10, 10;


-- To get the nth highest or lowest value, you use the following LIMIT clause:
-- 	SELECT select_list
-- 	FROM table_name
-- 	ORDER BY sort_expression
-- 	LIMIT n-1, 1;


-- The clause LIMIT n-1, 1 returns 1 row starting at the row n.
-- 9. finds the customer who has the second-highest credit:
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 1, 1;  -- skip 1 row, and return 1

-- Note that this technique works when there are no two customers who have the same credit limits. To get a more accurate result, you should use the DENSE_RANK() window function.
-- If you use the LIMIT clause with the DISTINCT clause, MySQL immediately stops searching when it finds the number of unique rows specified in the LIMIT clause.


-- 10. return the first five unique states in the customers table:
SELECT DISTINCT state
FROM customers
WHERE state is not NULL
LIMIT 5;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------
-- MySQL IS NULL (https://www.mysqltutorial.org/mysql-basics/mysql-is-null/)
-- To test whether a value is NULL or not, you use the  IS NULL operator.
-- If the value is NULL, the expression returns true. Otherwise, it returns false.
-- Note that MySQL does not have a built-in BOOLEAN type. It uses the TINYINT(1) to represent the BOOLEAN values i.e., true means 1 and false means 0.
-- Because the IS NULL is a comparison operator, you can use it anywhere that an operator can be used e.g., in the SELECT or WHERE clause.
SELECT 1 IS NULL,  -- 0
       0 IS NULL,  -- 0
       NULL IS NULL; -- 1
-- 1. find customers who do not have a sales representative:
SELECT customerName, salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IS NULL;

-- 2. get the customers who have a sales representative:
SELECT customerName, salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IS NOT NULL;