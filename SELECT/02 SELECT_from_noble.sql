--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln 1
-- Change the query shown so that it displays Nobel prizes for 1950.
-- QUERY 👇:
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;
 
-- Soln 2
-- Show who won the 1962 prize for Literature.
-- QUERY 👇:
SELECT winner
  FROM nobel
  WHERE yr = 1962
    AND subject = 'Literature';
 
-- Soln 3
-- Show the year and subject that won 'Albert Einstein' his prize.
-- QUERY 👇:
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';
 
-- Soln 4
-- Give the name of the 'Peace' winners since the year 2000, including 2000.
-- QUERY 👇:
SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace';
 
-- Soln 5
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
-- QUERY 👇:
SELECT yr, subject, winner FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;
 
-- Soln 6
-- Show all details of the presidential winners:
-- Theodore Roosevelt
-- Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
-- QUERY 👇:
 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama'
                 );
-- Soln 7
-- Show the winners with first name John
-- QUERY 👇:
SELECT winner FROM nobel WHERE winner LIKE 'John%';
 
-- Soln 8
-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
-- QUERY 👇:
SELECT yr, subject, winner FROM nobel WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);
 
-- Soln 9
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
-- QUERY 👇:
SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
 
 -- Soln 10 
 -- Show year, subject, and name of people who won a 'Medicine' 
 -- prize in an early year (before 1910, not including 1910) together with 
 -- winners of a 'Literature' prize in a later year (after 2004, including 2004)
 -- QUERY 👇:
SELECT yr, subject, winner FROM nobel WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

-- Soln 11
-- Find all details of the prize won by PETER GRÜNBERG
-- QUERY 👇:
SELECT * FROM nobel WHERE winner LIKE 'PETER GRÜNBERG';
 
-- Soln 12
-- Find all details of the prize won by EUGENE O'NEILL
-- QUERY 👇:
SELECT * FROM nobel WHERE winner LIKE 'EUGENE O\'NEILL';
 
-- Soln 13
-- List the winners, year and subject where the winner starts with Sir. 
-- Show the the most recent first, then by name order.
-- QUERY 👇:
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner;
 
-- Soln 14
-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
QUERY 👇:
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Chemistry', 'Physics'), subject, winner;

 --+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- Pick the code which shows the name of winner's names beginning with C and ending in n
-- SELECTION 👇:
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n';

-- Soln2
-- Select the code that shows how many Chemistry awards were given between 1950 and 1960
-- SELECTION 👇:
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960;

-- Soln3
-- Pick the code that shows the amount of years where no Medicine awards were given
-- SELECTION 👇:
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine');

-- Soln4
-- Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%';
-- RESULTS 👇:
-- Medicine	John Eccles
-- Medicine	Frank Macfarlane Burnet

-- Soln5
-- Select the code which would show the year when neither a Physics or Chemistry award was given
-- SELECTION 👇:
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'));
-- Soln6
-- Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
-- SELECTION 👇:
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- Soln7
-- Pick the result that would be obtained from the following code:
-- RESULTS 👇:
-- Chemistry	1
-- Literature	1
-- Medicine	2
-- Peace	1
-- Physics	1