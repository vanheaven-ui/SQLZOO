
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- soln 1 
-- Show the total population of the world.
-- QUERY 👇:
SELECT SUM(population) FROM world;

-- soln 2
-- List all the continents - just once each.
-- QUERY 👇:
SELECT continent FROM world GROUP BY continent;

-- soln 3
-- Give the total GDP of Africa
-- QUERY 👇:
SELECT SUM(gdp) AS total_gdp_Africa FROM world WHERE continent = 'Africa'; 

-- soln 4
-- How many countries have an area of at least 1000000
-- QUERY 👇:
SELECT COUNT(name) FROM world WHERE area >= 1000000;

-- soln 5
-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
-- QUERY 👇:
SELECT SUM(population) AS total_population FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- soln 6 
-- For each continent show the continent and number of countries.
-- QUERY 👇:
SELECT continent, count(name) AS No_countries FROM world GROUP BY continent;

-- soln 7 
-- For each continent show the continent and number of countries with populations of at least 10 million.
-- QUERY 👇:
SELECT continent, count(name) FROM world WHERE population >= 10000000 GROUP BY continent;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- soln 1 
-- Select the statement that shows the sum of population of all countries in 'Europe'
-- SELECTION 👇:
SELECT SUM(population) FROM bbc WHERE region = 'Europe';

-- soln 2 
-- Select the statement that shows the number of countries with population smaller than 150000
-- SELECTION 👇:
SELECT COUNT(name) FROM bbc WHERE population < 150000;

-- soln 3
-- Select the list of core SQL aggregate functions
-- SELECTION 👇:
-- AVG(), COUNT(), MAX(), MIN(), SUM()

-- soln 4 
-- Select the result that would be obtained from the following code:
 SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region;

  -- RESULT 👇:
-- No result due to invalid use of the WHERE function

-- soln 5
-- Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
-- SELECTION 👇:
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark');

-- soln 6 
-- Select the statement that shows the medium population density of each region
-- SELECTION 👇:
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- soln 7
-- Select the statement that shows the name and population density of the country with the largest population
-- SELECTION 👇:
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc);

-- soln 8
-- Pick the result that would be obtained from the following code:
 SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 2000000;

  -- RESULT 👇:

--   Table-D
-- Americas	732240
-- Middle East	13403102
-- South America	17740392
-- South Asia	9437710
