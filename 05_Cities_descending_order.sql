/*
Given the following data definition, select all city names in descending order:

	TABLE cities
		id INTEGER NOT NULL PRIMARY KEY
		name VARCHAR(30) NOT NULL

See the example case for more details.
*/

/**** EXAMPLE CASE BEGINS ****/
/*

-- Suggested testing environment: 
-- https://rextester.com/l/sql_server_online_compiler with language set as SQL Server

-- Example case create statement:
CREATE TABLE cities (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

INSERT INTO cities(id, name) values(1, 'Los Angeles');
INSERT INTO cities(id, name) values(2, 'Washington');
INSERT INTO cities(id, name) values(3, 'New York');

-- Expected output:
-- Washington
-- New York
-- Los Angeles

*/
/**** EXAMPLE CASE ENDS ****/

-- Write only the SQL statement that solves the problem and nothing else
SELECT name FROM cities ORDER BY name DESC