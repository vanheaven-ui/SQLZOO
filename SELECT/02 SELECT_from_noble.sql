-- Soln 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;
 
 -- Soln 2
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';
 
 -- Soln 3
 SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';
 
 -- Soln 4
 SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace';
 
 -- Soln 5
 SELECT yr, subject, winner FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989;
 
 -- Soln 6
 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama'
                 );
 -- Soln 7
 SELECT winner FROM nobel WHERE winner LIKE 'John%';
 
 -- Soln 8
 SELECT yr, subject, winner FROM nobel WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);
 
 -- Soln 9
 SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');
 
 -- Soln 10
 
 -- Soln 11
 SELECT * FROM nobel WHERE winner LIKE 'PETER GRÜNBERG';
 
 -- Soln 12
 SELECT * FROM nobel WHERE winner LIKE 'EUGENE O\'NEILL';
 
 -- Soln 13
 SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner;
 
 -- Soln 14
