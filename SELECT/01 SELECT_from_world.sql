-- Soln 1
-- show the name, continent and population of all countries.
-- QUERY 👇:
SELECT name, continent, population FROM world;

-- Soln 2
-- Show the name for the countries that have a population of at least 200 million.
-- QUERY 👇:
SELECT name FROM world WHERE population >= 200000000;

-- Soln 3
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
-- QUERY 👇:
SELECT name, gdp/population FROM world WHERE population >= 200000000;

-- Soln 4
-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
-- QUERY 👇:
SELECT name, population/1000000 FROM world WHERE continent LIKE 'south america';

-- Soln 5
-- Show the name and population for France, Germany, Italy
-- QUERY 👇:
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');

-- Soln 6
-- Show the countries which have a name that includes the word 'United'
-- QUERY 👇:
SELECT name FROM world WHERE name LIKE '%United%';

-- Soln 7
-- Show the countries that are big by area or big by population. Show name, population and area.
-- QUERY 👇:
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;

-- Soln 8
-- Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- QUERY 👇:
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;

-- Soln 9
-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- QUERY 👇:
SELECT name, ROUND(population/1000000, 2) AS population_millions, ROUND(gdp/1000000000, 2) AS gdp_billions FROM world WHERE continent = 'South America';

-- Soln 10
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
-- QUERY 👇:
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp FROM world WHERE gdp >= 1000000000000;

-- Soln 11
-- Show the name and capital where the name and the capital have the same number of characters.
-- QUERY 👇:
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);

-- Soln 12
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- QUERY 👇:
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND NOT name = capital;
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital; 

-- Soln 13
-- Find the country that has all the vowels and no spaces in its name.
-- QUERY 👇:
SELECT name FROM world WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';

-- QUIZ 
-- Soln 1
 Select the code which produces this table
name	population
Bahrain	1234571
Swaziland	1220000
Timor-Leste	1066409
-- SELECTION 👇:
SELECT name FROM world WHERE name LIKE 'U%';

-- Soln 2
-- SELECTION 👇:
SELECT population
  FROM world
 WHERE name = 'United Kingdom';
 
-- Soln 3
-- SELECTION 👇:
-- 'name' should be name

-- Soln 4
-- RESULT 👇:
-- Nauru	990

-- Soln 5
-- SELECTION 👇:
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia');
 
-- Soln 6
-- SELECTION 👇:
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo');
 
-- Soln 7
-- RESULT 👇:
-- Brazil
-- Colombia
-- Soln 8

