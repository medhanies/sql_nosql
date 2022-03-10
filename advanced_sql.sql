--Problem #1 – Join not involving a Primary Key to a Foreign Key
--List faculty who are also students. Include all student columns in the result. 

SELECT 
StdNo, 
StdFirstName,
StdLastName, 
StdCity, 
StdState, 
StdZip, 
StdMajor, 
StdClass, 
StdGPA 
FROM Student, Faculty
WHERE StdFirstName = FacFirstName;

--Problem #2 – Self Join
--List faculty members who have a higher salary than their supervisor 
--List the faculty number, last and first names, and salary for both 

SELECT
f1.FacNo,
CONCAT(f1.FacFirstName, ' ', f1.FacLastName) AS Name,
f1.FacSalary
FROM Faculty as f1, Faculty as f2
	WHERE f2.FacNo = f1.FacSupervisor 
	AND f1.FacSalary > f2.FacSalary;


--Problem #3 – Multiple Joins involving a Table more than once
--List the last and first names of faculty members and the course number for which the faculty member taught the same course number as their supervisor in 2013 

SELECT 
f.FacFirstName,
f.FacLastName,
c.CourseNo 
FROM Faculty as f
join Offering as o
on f.FacNo = o.FacNo
join Course as c
on o.CourseNo = c.CourseNo
WHERE o.OffYear = 2013;
 

--Problem #4 – Left Outer Join
--List all courses and their offerings 
--Include courses without offerings 
--List all columns of courses and offerings 
--(use a Left Outer Join) 

SELECT * FROM Course as c
LEFT JOIN Offering as o 
ON c.CourseNo = o.CourseNo;

 

--Problem #5 – Right Outer Join
--List all offerings and the faculty assigned to teach them 
--Also include courses without a faculty assigned to them 
--List year, term, course number, offering number, faculty last and first name (use a Right Outer Join) 

SELECT 
o.OffYear,
o.OffTerm,
o.CourseNo,
o.OfferNo,
f.FacLastName,
f.FacFirstName
FROM Faculty as f
RIGHT JOIN Offering as o
ON o.FacNo = f.FacNo
ORDER BY o.OffYear;

 

--Problem #6 – Mixing Left Outer Join with Inner Joins
--List information for all IS courses offered in 2013 with at least 1 student enrolled 
--Include offerings without a faculty assigned 
--List the offer number, course number, term, description,  faculty number, faculty last and first names 
--Suppress duplicates when more than 1 student is enrolled 

SELECT 
o.OfferNo,
c.CourseNo,
o.OffTerm,
c.CrsDesc,
f.FacNo,
f.FacFirstName,
f.FacLastName
FROM Course as c
LEFT JOIN Offering as o
ON o.CourseNo = c.CourseNo
JOIN Faculty as f 
ON f.FacNo = o.FacNo
WHERE o.CourseNo LIKE 'IS%'
GROUP BY f.FacFirstName, f.FacLastName
ORDER BY f.FacLastName;

--Problem #7 – Examining the difference between UNION and UNION ALL
--Retrieve all faculty and students 
--Only show common columns in the result 
--Remove duplicates 
--Repeat query allowing duplicates 

SELECT * FROM Students
UNION
SELECT * FROM Faculty;

SELECT * FROM Students
UNION ALL
SELECT * FROM Faculty;

--Problem #8 – Type 1 Subquery (nested one level)
--List student last and first names and majors for students who had at least one high grade (>= 
--3.5) in at least one course offered in fall of 2012 
--(use a Type 1 Subquery) 

SELECT s.StdLastName, s.StdFirstName, s.StdMajor FROM Student AS s
JOIN Enrollment AS e
ON s.StdNo = e.StdNo
WHERE e.EnrGrade >= 3.5
	AND e.OfferNo IN
(SELECT o.OfferNo FROM Offering AS o
WHERE o.OffTerm = 'FALL' AND o.OffYear = 2012);

--Problem #9 – Type 1 Subquery (nested multiple levels)
--List student last and first names and majors for students who had at least one high grade  
--(>= 3.5) in at least one course offered in winter of 2013 which was not taught by Leonard Vince (Use nested Type 1 Subqueries) 

SELECT s.StdLastName, s.StdFirstName, s.StdMajor FROM Student AS s
JOIN Enrollment AS e
ON s.StdNo = e.StdNo
WHERE e.EnrGrade >= 3.5
	AND e.OfferNo IN
(SELECT o.OfferNo FROM Offering AS o
WHERE o.OffTerm = 'WINTER' AND o.OffYear = 2013
AND o.FacNo NOT IN (SELECT f.FacNo FROM Faculty AS f
WHERE f.FacFirstName = 'LEONARD' AND f.FacLastName = 'VINCE'));

--Problem #10 – Type 2 Subquery
--Retrieve the faculty last and first names of faculty who are not students 
--(use a Type 2 Subquery) 

SELECT f.FacLastName, f.FacFirstName FROM Faculty AS f
WHERE NOT EXISTS (SELECT * FROM Student AS s WHERE s.StdNo = f.FacNo);

--Problem #11 – Division Problem using Type 2 Subquery
--List faculty last and first names of faculty who taught all of the fall of 2012 IS offerings 

SELECT * FROM Faculty AS f INNER JOIN Offering AS o ON f.FacNo = o.FacNo WHERE o.OffTerm = 'FALL' AND o.OffYear= 2012 AND o.CourseNo LIKE 'IS*' 
GROUP BY f.FacLastName, f.FacFirstName HAVING COUNT(*) = (SELECT COUNT(*) FROM Offering AS o1 
WHERE o1.OffTerm = 'FALL' AND o1.OffYear = 2012 AND o1.CourseNo LIKE 'IS*');

--Problem #12 – Subquery in the FROM Clause aka “Table on the fly”
--List the course number, course description, number of offerings, and the average enrollment across offerings 

SELECT t.CourseNo, t.CrsDesc, COUNT(*) AS NumOfferings, AVG(t.EnrollCount) AS AvgEnroll 
FROM (SELECT c.CourseNo, c.CrsDesc, o.OfferNo, COUNT(*) AS EnrollCount 
FROM (Course AS c INNER JOIN Offering AS o ON c.CourseNo = o.CourseNo)INNER JOIN Enrollment AS  e ON o.OfferNo = e.OfferNo 
GROUP BY c.CourseNo, c.CrsDesc, o.OfferNo) t GROUP BY t.CourseNo, t.CrsDesc 
ORDER BY 1,2;

