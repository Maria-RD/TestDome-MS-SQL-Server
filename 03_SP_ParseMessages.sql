/*
In a company, several different programs insert rows into a messages
table which should later be parsed and inserted into appropiate
tables. Consider the tables:

	TABLE messages
		id INTEGER NOT NULL PRIMARY KEY
		type VARCHAR(30) NOT NULL
		data VARCHAR(100) NOT NULL
		
	TABLE notifications
		id INTEGER NOT NULL PRIMARY KEY
		message VARCHAR(100) NOT NULL
		
	TABLE alerts
		id INTEGER NOT NULL PRIMARY KEY
		shortMessage VARCHAR(15) NOT NULL
		
Create a procedure called ParseMessages, in the default schema, which
should do the following for all rows in the messages table:

	* Insert all rows where the type is 'notification' to the
	notifications table with the message field being set to the data
	field of messages table.
	* Insert all rows where the type is 'alert' to the alerts table
	with the shortMessage field being set to the first 15 characters
	of the data field of messages table.
	
In both cases the id field should be the same as in the messages field.

See the example case here for more details.
*/

/**** EXAMPLE CASE BEGINS ****/
/*

-- Suggested testing environment:
-- https://sqliteonline.com/ with language set as MS SQL

-- Example case create statement:
CREATE TABLE messages ( 
    id INTEGER NOT NULL PRIMARY KEY,
    type VARCHAR(30) NOT NULL,
    data VARCHAR(100) NOT NULL
);

CREATE TABLE notifications ( 
    id INTEGER NOT NULL PRIMARY KEY,
    message VARCHAR(100) NOT NULL
);

CREATE TABLE alerts ( 
    id INTEGER NOT NULL PRIMARY KEY,
    shortMessage VARCHAR(15) NOT NULL
);

INSERT INTO messages (id, type, data) VALUES (0, 'notification', 'Hello') ;
INSERT INTO messages (id, type, data) VALUES (1, 'alert', 'Danger! Danger! Danger!');

-- Execute your submission in a separate run from the CREATE TABLE statements
-- Write your code here

-- Execute this in a separate run from your submission
EXEC ParseMessages;

SELECT id, 'notification' as type, message FROM notifications 
UNION
SELECT id, 'alert' as type, shortMessage FROM alerts
-- Expected output (in any order):
-- id   type            message
-- ----------------------------
-- 0    notification    Hello
-- 1    alert           Danger! Danger!

/*
/**** EXAMPLE CASE ENDS ****/

-- Write only the T-SQL code that solves the problem and nothing else
CREATE PROCEDURE dbo.ParseMessages AS
BEGIN
  INSERT INTO notifications(id, message)
  SELECT id, data FROM messages
  WHERE type = 'notification'
  
  INSERT INTO alerts(id, shortMessage)
  SELECT id, SUBSTRING(data, 0, 16) as data FROM messages
  WHERE type = 'alert'
END