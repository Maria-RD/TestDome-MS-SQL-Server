/*
Information about pets is kept in two separate tables:

	TABLE dogs
		id INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL
		
	TABLE cats
		id INTEGER NOT NULL PRIMARY KEY,
		name VARCHAR(50) NOT NULL
*/

/**** EXAMPLE CASE BEGINS ****/
/*
-- Suggested testing environments
-- For MS SQL:
-- https://sqliteonline.com/ with language set as MS SQL
-- For MySQL:
-- https://www.db-fiddle.com/ with MySQL version set to 8
-- For SQLite:
-- http://sqlite.online/

-- Example case create statement:
CREATE TABLE dogs (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

CREATE TABLE cats (
  id INTEGER NOT NULL PRIMARY KEY, 
  name VARCHAR(50) NOT NULL
);

INSERT INTO dogs(id, name) values(1, 'Lola');
INSERT INTO dogs(id, name) values(2, 'Bella');
INSERT INTO cats(id, name) values(1, 'Lola');
INSERT INTO cats(id, name) values(2, 'Kitty');

-- Expected output (in any order):
-- name     
-- -----
-- Bella    
-- Kitty    
-- Lola

*/
/**** EXAMPLE CASE ENDS ****/

-- Write only the SQL statement that solves the problem and nothing else
SELECT name from dogs
UNION
SELECT name from cats