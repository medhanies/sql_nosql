--For the following SQL coding problems use the “University.sql” script to create yours tables in Oracle LiveSQL.

--Problem #1 – Retrieving all rows and all columns from a table
--For each of our tables, retrieve all rows and all columns.
--Tables are Student, Faculty, Offering, Course, and Enrollment

SELECT * FROM student;
SELECT * FROM faculty;
SELECT * FROM enrollment;
SELECT * FROM course;
SELECT * FROM offering;

--(no need to sort at this point)

--Problem #2 – Retrieving a subset of columns from a table and sorting them 
--both with and without the ASC keyword

--Retrieve the student number, student first name, and student last name for all students
--Sort the results by student last name then by student first name
--Use the ASC keyword on the query
--Repeat the query omitting ASC

SELECT stdno, stdfirstname, stdlastname
FROM student
ORDER BY stdlastname ASC, stdfirstname

SELECT stdno, stdfirstname, stdlastname
FROM student
ORDER BY stdlastname, stdfirstname


--Problem #3 – Retrieving a subset of columns from a table and sorting them on multiple columns mixing ascending and descending order, using both named and positional notation
--Retrieve the student last name, student first name, and GPA for all students
--Sort the results by GPA highest first, then by student last name, then by student first name
--Use column names to sort (omit ASC)

SELECT stdlastname, stdfirstname, stdgpa
FROM student
ORDER BY stdgpa DESC, stdlastname, stdfirstname

--Repeat the query using positional notation

SELECT stdlastname, stdfirstname, stdgpa
FROM student
ORDER BY 3 DESC, 1, 2

--Problem #4 – Retrieving columns from a table both with and without duplicates
--Retrieve the student city and class for all students with duplicates

SELECT stdcity, stdclass
FROM student

--Repeat query without duplicates

SELECT stdcity, stdclass, COUNT(*)
FROM student
GROUP BY stdcity, stdclass
HAVING COUNT(*) = 1

OR
SELECT DISTINCT stdcity, stdclass FROM student

--Problem #5 – Retrieving a subset of rows with a single Boolean expression
--Retrieve the student last name, student first name, and GPA for all students with a GPA greater than 3.2

SELECT stdlastname, stdfirstname, stdgpa
FROM student
WHERE stdgpa > 3.2

--Problem #6 – Retrieving a subset of rows with multiple complex Boolean expressions
--Retrieve the student last name, student first name, and GPA for all students with a GPA 
(--more than 2.2 and less than 2.7) OR (more than 3.2 and less than 3.8)

SELECT stdlastname, stdfirstname, stdgpa
FROM student
WHERE (stdgpa > 2.2 and stdgpa < 2.7)  OR  (stdgpa > 3.2 and stdgpa < 3.8)

--Problem #7 – Retrieving a subset of rows with the BETWEEN operator
--Retrieve the student last name, student first name, and GPA for all students with a GPA that is between 2.7 and 3.2 inclusive

SELECT stdlastname, stdfirstname, stdgpa
FROM student
WHERE stdgpa BETWEEN 2.7 and 3.2

--Problem #8 – Retrieving a subset of rows with testing for NULLs
--Retrieve the offer number, course number, year, and faculty number from all course offerings that has not yet been assigned a Faculty

SELECT offerno, courseno, offyear, facno
FROM offering
WHERE facno is null

--Repeat query for course offerings that have been assigned a Faculty

SELECT offerno, courseno, offyear, facno
FROM offering
WHERE facno is NOT null

