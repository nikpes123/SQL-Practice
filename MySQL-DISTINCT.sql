-- https://www.mysqltutorial.org/mysql-basics/mysql-distinct/
--  When querying data from a table, you may get duplicate rows. To remove these duplicate rows, you use the DISTINCT clause in the SELECT statement.
 -- Here’s the syntax of the DISTINCT clause:
		--  SELECT DISTINCT
		--     select_list
		-- FROM
		--     table_name
		-- WHERE 
		--     search_condition
		-- ORDER BY 
		--     sort_expression;
        
-- In this syntax, you specify one or more columns that you want to select distinct values after the SELECT DISTINCT keywords.

-- If you specify one column, the DISTINCT clause will evaluate the uniqueness of rows based on the values of that column.

-- However, if you specify two or more columns, the DISTINCT clause will use the values of these columns to evaluate the uniqueness of the rows.

-- When executing the SELECT statement with the DISTINCT clause, MySQL evaluates the DISTINCT clause after the FROM, WHERE, and SELECT clause and before the ORDER BY clause:

-- 1. find employees whose lastnames are unqiue
SELECT DISTINCT lastName
FROM employees;

-- When you specify a column that has NULL values in the DISTINCT clause, the DISTINCT clause will keep only one NULL value because it considers all NULL values are the same. 
-- 2. get a unique combination of city and state from the customers 
SELECT DISTINCT state, city
FROM customers
WHERE state IS NOT NULL;