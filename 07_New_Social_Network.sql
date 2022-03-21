/*
A new social network site has the following data tables:

----------------------
|       users	     |
----------------------
| id |  name  | sex  |
----------------------
| 1  | Ann    | null |
| 2  | Steve  | m    |
| 3  | Mary   | f    |
| 4  | Brenda | f    |
----------------------

----------------------
|       friends	     |
----------------------
|   user1  |  user2  |
----------------------
| 1        | 2       |
| 1        | 3       |
| 2        | 3       |
----------------------

Select data that will be returned by the following SQL query:
	
	SELECT users.name, COUNT(*) as count FROM users
	LEFT JOIN friends
	ON users.id = friends.user1 OR users.id = friends.user2
	WHERE users.sex = 'f'
	GROUP BY users.id, users.name;
	
(Select all acceptable answers.)

| | Ann, 1
| | Ann, 2
| | Steve, 1
| | Steve, 2
| | Mary, 1
|x| Mary, 2
| | Brenda, 0
|x| Brenda, 1

*/
