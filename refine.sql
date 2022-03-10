show databases;

use book_shop;

show tables;

SELECT * FROM books;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT * FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT author_lname FROM books;

SELECT DISTINCT released_year FROM books;

SELECT author_fname, author_lname FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;

SELECT author_lname FROM books ORDER BY author_lname;

SELECT title FROM books ORDER BY title;

SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT released_year FROM books ORDER BY released_year DESC;

SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname
FROM books ORDER BY 3;

SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;

SELECT title FROM books LIMIT 10;

SELECT * FROM books LIMIT 1;

SELECT title, released_year FROM books
ORDER BY 2 DESC LIMIT 0,5;

SELECT title, released_year FROM books
ORDER BY 2 DESC LIMIT 14;

SELECT title FROM books
LIMIT 5, 100;

SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';

SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';

SELECT title FROM books WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';

SELECT title FROM books WHERE title LIKE '%\%%'

SELECT title FROM books WHERE title LIKE '%\_%'

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books
ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books
ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM books
ORDER BY author_lname, title;

SELECT CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname),' !') AS yell
FROM books ORDER BY author_lname;
























