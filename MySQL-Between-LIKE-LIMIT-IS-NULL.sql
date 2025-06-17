-- MySQL BETWEEN (https://www.mysqltutorial.org/mysql-basics/mysql-between/)
--  The BETWEEN operator is a logical operator that specifies whether a value is in a range or not. Here’s the syntax of the BETWEEN operator: value BETWEEN low AND high;
--  The BETWEEN operator returns 1 if: value >= low AND value <= high. Otherwise, it returns 0.
-- If the value, low, or high is NULL, the BETWEEN operator returns NULL .


-- NOT BETWEEN
-- To negate the BETWEEN operator, you use the NOT operator: value NOT BETWEEN low AND high
-- The NOT BETWEEN operator returns 1 if: value < low OR value > high. Otherwise, it returns 0.

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
