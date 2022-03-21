/*
The following table is used in an application that tracks the items its users bought:
	TABLE items
		id INTEGER NOT NULL PRIMARY KEY
		name VARCHAR(30) NOT NULL
		dateBought DATE NOT NULL
		
Finish the ItemsBought procedure so that it returns only items whose dateBought is
between @date and one month agter @date (both inclusive). For each item it should
return:
	* The day of the month the item was bought [1-31].
	* The number og the month the item was bought [1-12].
	* The name of the item.
	
See the example case here for more details.
*/

/**** EXAMPLE CASE BEGINS ****/
/*
-- Suggested testing environment:
-- https://sqliteonline.com/ with language set as MS SQL
-- Example case create statement:
CREATE TABLE items (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    dateBought DATE NOT NULL
);
INSERT INTO items (id, name, dateBought) VALUES (0, 'Eggs', '2020-08-01');
INSERT INTO items (id, name, dateBought) VALUES (1, 'Couch', '2020-07-23');
INSERT INTO items (id, name, dateBought) VALUES (2, 'Potatoes', '2020-01-11');
INSERT INTO items (id, name, dateBought) VALUES (3, 'Llama', '2020-09-01');
-- Execute your submission in a separate run from the CREATE TABLE statements
CREATE PROCEDURE ItemsBought (@date DATE) AS
BEGIN
  -- Write your code here
  SELECT * FROM items;
END;
-- Execute this in a separate run from your submission
EXEC ItemsBought '2020-08-01'
-- Expected output:
-- day    month    name
----------------------
-- 1      8        Eggs
-- 1      9        Llama
*/
/**** EXAMPLE CASE ENDS ****/

-- Write only the T-SQL code that solves the problem and nothing else
CREATE PROCEDURE ItemsBought (@date DATE) AS
BEGIN
    SELECT
      DATEPART(day, dateBought) AS day,
      DATEPART(month, dateBought) AS month,
      name
    FROM items
    WHERE dateBought BETWEEN @date AND DATEADD(month, 1, @date)
END;