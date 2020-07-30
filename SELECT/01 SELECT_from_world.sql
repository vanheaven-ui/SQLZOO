# Soln 1
SELECT name, continent, population FROM world;

# Soln 2
SELECT name FROM world WHERE population >= 200000000;

# Soln 3
SELECT name, gdp/population FROM world WHERE population >= 200000000;

# Soln 4
SELECT name, population/1000000 FROM world WHERE continent LIKE 'south america';

# Soln 5
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy');

# Soln 6
SELECT name FROM world WHERE name LIKE '%United%';

# Soln 7
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;

# Soln 8
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;

# Soln 9
SELECT name, ROUND(population/1000000, 2) AS population_millions, ROUND(gdp/1000000000, 2) AS gdp_billions FROM world WHERE continent = 'South America';

# Soln 10
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp FROM world WHERE gdp >= 1000000000000;

# Soln 11
SELECT name, capital FROM world WHERE LENGTH(name) = LENGTH(capital);

# Soln 12
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND NOT name = capital;
SELECT name, capital FROM world WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital; 

# Soln 13
SELECT name FROM world WHERE name NOT LIKE '% %' AND name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%';

# QUIZ 
# Soln 1
SELECT name FROM world WHERE name LIKE 'U%';

-- Soln 2
SELECT population
  FROM world
 WHERE name = 'United Kingdom';
 
-- Soln 3
-- 'name' should be name

# Soln 4
-- Nauru	990
# Soln 5
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia');
# Soln 6
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo');
 
# Soln 7
-- Brazil
-- Colombia
# Soln 8

