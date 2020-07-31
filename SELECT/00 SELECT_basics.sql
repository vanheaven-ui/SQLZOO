--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--Soln 1
-- show the population of Germany
-- QUERY 👇:
SELECT population FROM world WHERE name = 'Germany';

--Soln 2
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'
-- QUERY 👇:
SELECT name, population FROM world WHERE name IN ( 'Sweden', 'Norway', 'Denmark');

--Soln 3
-- QUERY 👇:
-- show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- Select the code which produces this table
-- name	population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste	1066409
-- SELECTION 👇:
SELECT name, population FROM world WHERE population BETWEEN 1000000 AND 1250000;

-- Soln2
-- Pick the result you would obtain from this code:
SELECT name, population FROM world WHERE name LIKE "Al%";
-- RESULT 👇:
-- Albania	3200000
-- Algeria	32900000

-- Soln3
--Select the code which shows the countries that end in A or L
-- SELECTION 👇:
SELECT name FROM world WHERE name LIKE '%a' OR name LIKE '%l';

-- Soln4
-- Pick the result from the query
SELECT name,length(name) FROM world WHERE length(name)=5 and region='Europe';
-- RESULT 👇:
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5

-- Soln5
-- Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000;
-- RESULT 👇:
-- Andorra	936

-- Soln6
-- Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
-- SELECTION 👇:
SELECT name, area, population FROM world WHERE area > 50000 AND population < 10000000;

-- Soln7
-- Select the code that shows the population density of China, Australia, Nigeria and France
-- SELECTION 👇:
SELECT name, population/area FROM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');
