/*
A table containing the students enrolled in a yearly course has incorrect data
in records with ids between 20 and 100 (inclusive).

	TABLE enrollments
		id INTEGER NOT NULL PRIMARY KEY
		year INTEGER NOT NULL
		studentID INTEGER NOT NULL
		
Write a query that updates the field 'year' of every faulty record to 2015.
*/

-- Write only the SQL statement that solves the problem and nothing else
UPDATE enrollments SET year = 2015 WHERE id BETWEEN 20 AND 100