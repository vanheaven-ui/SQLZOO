--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- List the teachers who have NULL for their department.
-- QUERY 👇:
SELECT teacher.name FROM teacher LEFT JOIN dept ON dept = dept.id WHERE dept IS NULL;

-- Soln2
-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
-- QUERY 👇:
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);

-- Soln3
-- Use a different JOIN so that all teachers are listed.
-- QUERY 👇:
SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON dept = dept.id;

-- Soln4
-- Use a different JOIN so that all departments are listed.
-- QUERY 👇:
SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON dept = dept.id;

-- Soln5
-- Using the COALESCE function,
-- Show teacher name and mobile number or '07986 444 2266'
-- QUERY 👇:
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher;

-- Soln6
-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. 
-- Use the string 'None' where there is no department.
-- QUERY 👇:
SELECT COALESCE(teacher.name, 'None'), COALESCE(dept.name, 'None') 
  FROM teacher LEFT  JOIN dept ON dept = dept.id;

-- Soln7
-- Use COUNT to show the number of teachers and the number of mobile phones.
-- QUERY 👇:
SELECT COUNT(teacher.name), COUNT(mobile) FROM teacher;

-- Soln8
-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. 
-- Use a RIGHT JOIN to ensure that the Engineering department is listed.
-- QUERY 👇:
SELECT dept.name, COUNT(teacher.name) 
  FROM teacher RIGHT JOIN dept ON dept = dept.id 
    GROUP BY dept.name;

-- Soln9
-- Use CASE to show the name of each teacher followed by 'Sci' 
-- if the teacher is in dept 1 or 2 and 'Art' otherwise.
-- QUERY 👇:
SELECT teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END 
  FROM teacher LEFT JOIN dept ON dept = dept.id; 

-- Soln10
-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, 
-- show 'Art' if the teacher's dept is 3 and 'None' otherwise.
-- QUERY 👇:
SELECT teacher.name, 
       CASE 
        WHEN dept = 1 OR dept = 2 THEN 'Sci' 
          WHEN dept = 3 THEN 'Art' 
            ELSE 'None' 
       END 
  FROM teacher LEFT JOIN dept ON dept = dept.id;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- Select the code which uses an outer join correctly.
-- SELECTION 👇:
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);

-- Soln2
-- Select the correct statement that shows the name of department which employs Cutflower -
-- SELECTION 👇:
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';

-- Soln3
-- SELECTION 👇:
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;

-- Soln4
-- Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
-- ANSWER 👇:
-- display 0 in result column for all teachers without department

-- Soln5
-- Query:
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher
-- shows following 'digit':
-- SELECTION 👇:
-- 'four' for Throd

-- Soln6
-- Select the result that would be obtained from the following code:
 SELECT name, 
      CASE 
       WHEN dept 
        IN (1) 
        THEN 'Computing' 
       ELSE 'Other' 
      END 
  FROM teacher
-- SELECTION 👇:
--      Table-A
-- Shrivell	Computing
-- Throd	Computing
-- Splint	Computing
-- Spiregrain	Other
-- Cutflower	Other
-- Deadyawn	Other