-- MySQL AND Operator (https://www.mysqltutorial.org/mysql-basics/mysql-and/)
-- MySQL doesn’t have a built-in Boolean type. Instead, it uses the number zero as FALSE and non-zero values as TRUE. 
--  The AND operator is a logical operator that combines two or more Boolean expressions and returns 1, 0, or NULL: A AND B
--  In this expression, A and B are called operands. They can be literal values or expressions.
-- The logical AND operator returns 1 if both A and B are non-zero and not NULL. It returns 0 if either operand is zero; otherwise, it returns NULL.
-- The logical AND operator returns 1 if both A and B are non-zero and NOT NULL. For example:
SELECT 1 AND 1;
SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;
SELECT 1 AND NULL, NULL AND NULL;
-- In practice, you’ll use the AND operator in the WHERE clause of the SELECT, UPDATE, DELETE statements to form a condition. Also, you can the AND operator in the conditions of the INNER JOIN and LEFT JOIN clauses.

-- When evaluating an expression that contains the AND operator, MySQL stops evaluating the remaining parts of the expression as soon as it can determine the result.

-- This is called short-circuit evaluation. In other words, the AND operator is short-circuited. For example:
SELECT 1 = 0 AND 1 / 0 ;
-- In this example, MySQL only evaluates the first part 1 = 0 of the expression 1 = 0 AND 1  / 0.

-- Since the expression 1 = 0 returns 0, MySQL can determine the result of the whole expression, which is 0.

-- Therefore, MySQL doesn’t need to evaluate the remaining part of the expression, which is 1/0; it would issue a division by zero error.
USE classicmodels;
 -- 1. find customers who are located in California (CA), USA: 
 SELECT customerName, state, country
 FROM customers
 WHERE state = "CA" AND country = "USA";
 
 -- 2. the customers who are located in California, USA, and have a credit limit greater than 100K.
  SELECT customerName, state, country, creditLimit
 FROM customers
 WHERE state = "CA" AND
	country = "USA" AND
	creditLimit > 100000;

-- ------------------------------------------------------------------------------------------------------------
-- MySQL OR Operator (https://www.mysqltutorial.org/mysql-basics/mysql-or/)
-- The MySQL OR operator is a logical operator that combines two Boolean expressions. 
	-- A OR B
-- If both A and B are not NULL, the OR operator returns 1 (true) if either A or B is non-zero. For example:
SELECT 1 OR 1, 1 OR 0, 0 OR 1;

-- If both A and B are zero (false), the OR operator returns zero. For example:
 SELECT 0 OR 0;
 
 -- When A and / or B is NULL, the OR operator returns 1 (true) if either A or B is non-zero. Otherwise, it returns NULL. For example:
SELECT 1 OR NULL, 0 OR NULL, NULL or NULL;

-- Like the AND operator, the OR operator is also short-circuited. In other words, MySQL stops evaluating the remaining parts of the expression as soon as it can determine the result. For example:
SELECT 1 = 1 OR 1 / 0;
-- Because the expression 1 = 1 always returns 1, MySQL won’t evaluate the 1 / 0 expression. And MySQL would issue an error if it did.


-- When an expression contains both AND and OR operators, MySQL uses the operator precedence to determine the order of evaluation of the operators. MySQL evaluates the operator with higher precedence first.

-- Since the AND operator has higher precedence than the OR operator, MySQL evaluates the AND operator before the OR operator. For example:
    SELECT 1 OR 0 AND 0;
    SELECT 1 OR 0 AND 0 = 1 OR 0 = 1;
    
-- 1.  select all the customers located in the USA or France:
SELECT customerName, country
FROM customers
WHERE country = "USA" OR country = "France";

--  2. select the customers who locate in the USA or France and have a credit limit greater than 100,000.
SELECT customerName, country, creditLimit
FROM customers
WHERE (country = "USA" OR country = "France") AND creditLimit > 100000;


-- ------------------------------------------------------------------------------------------------------------
-- MySQL IN (https://www.mysqltutorial.org/mysql-basics/mysql-in/) 
-- The IN operator allows you to determine if a value matches any value in a list of values. Here’s the syntax of the IN operator:
-- The IN operator returns 1 (true) if the value equals any value in the list (value1, value2, value3,…). Otherwise, it returns 0.
--  In this syntax: value IN (value1, value2, value3,...)
	-- First, specify the value to test on the left side of the IN operator. The value can be a column or an expression.
	-- Second, specify a comma-separated list of values to match in the parentheses.
    
-- The IN operator is functionally equivalent to a combination of multiple OR operators:
-- 	value = value1 OR value = value2 OR value = value3 OR ...

-- Generally, the IN operator returns NULL in two cases:

-- 	The value on the left side of the operator is NULL.
SELECT NULL IN (1,2,3);
-- 	The value doesn’t equal any value in the list and one of the values in the list is NULL.
SELECT 0 IN (1 , 2, 3, NULL);

-- The following example also returns NULL because NULL is not equal to any value in the list and the list has one NULL. Note that NULL is not equal to NULL.
SELECT NULL IN (1 , 2, 3, NULL);

-- 1.  find the offices located in the USA and France:
SELECT *
FROM offices
WHERE country IN ("USA", "France");

-- ------------------------------------------------------------------------------------------------------------
-- MySQL NOT IN (https://www.mysqltutorial.org/mysql-basics/mysql-not-in/)
-- The NOT operator negates the IN operator: value NOT IN (value1, value2, value2)
-- The NOT IN operator returns one if the value doesn’t equal any value in the list. Otherwise, it returns 0.

-- The NOT IN operator returns NULL if the value on the left side of the IN operator is NULL. For example:
SELECT NULL NOT IN (1,2,3);

-- Technically, the NOT IN operator is equivalent to the following:
-- NOT (value = value1 OR value = value2 OR value = valu3)
-- value <> value1 AND value <> value2 AND value <> value3

-- 1. find the offices that are not located in France and the USA: 
SELECT officeCode, city, state, country
FROM offices
WHERE country NOT IN  ("France", "USA");





