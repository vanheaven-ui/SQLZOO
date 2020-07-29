SELECT population FROM world WHERE name = 'Germany';

SELECT name, population FROM world WHERE name IN ( 'Sweden', 'Norway', 'Denmark');

SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

-- QUIZ 01 solutions

SELECT name, population FROM world WHERE population BETWEEN 1000000 AND 1250000;

SELECT name, population FROM world WHERE name LIKE "Al%";
-- Albania	3200000
-- Algeria	32900000

SELECT name FROM world WHERE name LIKE '%a' OR name LIKE '%l';

SELECT name,length(name) FROM world WHERE length(name)=5 and region='Europe';
-- name	length(name)
-- Italy	5
-- Malta	5
-- Spain	5

SELECT name, area*2 FROM world WHERE population = 64000; 
-- Andorra	936

SELECT name, area, population FROM world WHERE area > 50000 AND population < 10000000;

SELECT name, population/area FROM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');
