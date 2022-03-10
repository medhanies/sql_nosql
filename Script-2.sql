SELECT title from books;

SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10); 

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

SELECT CONCAT
(
	SUBSTRING(title, 1, 10),
			'...'
) AS 'short title'
FROM books;

SELECT REPLACE('HellO World', 'O', '0') 