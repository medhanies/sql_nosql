SELECT 
	SUBSTRING(REPLACE(title, 'e', '3'),1,10) 
FROM books;

SELECT REVERSE(author_fname) FROM books;


SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

SELECT UPPER(title) FROM books;

SELECT LOWER(author_fname) FROM books;

SELECT CONCAT('MY FAVORITE BOOK IS ',UPPER(title)) FROM books;

SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'));

SELECT 
	REPLACE 
	(
		CONCAT('I', ' ', 'like', ' ', 'cats'),
		' ',
		'-'
	);
	
SELECT REPLACE(title, ' ', '->') AS title FROM books;

SELECT (author_lname) AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname,' ', author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

select title, CHAR_LENGTH(title) AS 'character count' FROM books;

SELECT 
	CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
	CONCAT(author_lname, ',', author_fname) AS author,
	CONCAT(stock_quantity, ' in stock') AS quantity 
FROM books;





