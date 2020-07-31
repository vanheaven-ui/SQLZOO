--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- How many stops are in the database.
-- QUERY 👇:
SELECT COUNT(name) FROM stops;

-- Soln2
-- Find the id value for the stop 'Craiglockhart'
-- QUERY 👇:
SELECT stops.id FROM stops WHERE name = 'Craiglockhart';

-- Soln3
-- Give the id and the name for the stops on the '4' 'LRT' service.
-- QUERY 👇:
SELECT id, name FROM stops JOIN route ON stop = id WHERE num = '4' AND company = 'LRT';

-- Soln4
-- QUERY 👇:
SELECT company, num, COUNT(*)
  FROM route 
    WHERE stop=149 OR stop=53
      GROUP BY company, num 
        HAVING COUNT(*) = 2;

-- Soln5
-- show the services from Craiglockhart to London Road
-- QUERY 👇:
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

-- Soln6
-- show the services between 'Craiglockhart' and 'London Road' 
-- QUERY 👇:
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- Soln7
-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
-- QUERY 👇:
SELECT DISTINCT a.company, a.num
  FROM route a JOIN route b ON 
    (a.company = b.company) AND (a.num = b.num)
    JOIN stops stopa ON (stopa.id = a.stop)
    JOIN stops stopb ON (stopb.id = b.stop)
WHERE stopa.id = 115 AND stopb.id = 137;
-- Soln8
-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
-- QUERY 👇:
SELECT a.company, a.num 
  FROM route a 
    JOIN route b ON (a.company = b.company AND a.num = b.num)
    JOIN stops stopa ON (stopa.id = a.stop)
    JOIN stops stopb ON (stopb.id = b.stop)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

-- Soln9
-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, 
-- including 'Craiglockhart' itself, offered by the LRT company. 
-- Include the company and bus no. of the relevant services.
-- QUERY 👇:
SELECT DISTINCT s2.name, r2.company, r2.num 
  FROM stops s1, stops s2, route r1, route r2
WHERE s1.name = 'Craiglockhart'
  AND s1.id = r1.stop 
  AND r1.company = r2.company
  AND r1.num = r2.num
  AND s2.id = r2.stop
  AND r1.company = 'LRT';



--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- Select the code that would show it is possible to get from Craiglockhart to Haymarket
-- SELECTION 👇:
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket';

--  Soln 2
--  Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
-- SELECTION 👇:
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A';

-- Soln 3
-- Select the code that shows the services available from Tollcross?
-- SELECTION 👇:
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross';