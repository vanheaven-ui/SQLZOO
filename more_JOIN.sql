--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  TUTORIAL solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln1
-- List the films where the yr is 1962 [Show id, title]
-- QUERY 👇:
SELECT id, title
 FROM movie
 WHERE yr=1962

-- Soln2
-- Give year of 'Citizen Kane'.
-- QUERY 👇:
SELECT yr FROM movie WHERE title = 'Citizen Kane';

-- Soln3
-- List all of the Star Trek movies, include the id, title and 
-- yr (all of these movies include the words Star Trek in the title). Order results by year.
-- QUERY 👇:
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr;

-- Soln4
-- What id number does the actor 'Glenn Close' have?
-- QUERY 👇:
SELECT id FROM actor WHERE name = 'Glenn Close';

-- Soln5
-- What is the id of the film 'Casablanca'
-- QUERY 👇:
SELECT id FROM movie WHERE title = 'Casablanca';

-- Soln6
-- what is a cast list?
-- QUERY 👇:
SELECT name FROM actor JOIN casting ON id = actorid WHERE movieid = '11768';

-- Soln7
-- Obtain the cast list for the film 'Alien'
-- QUERY 👇:
SELECT name 
  FROM actor JOIN casting ON actor.id = actorid 
    WHERE movieid = 
    (SELECT DISTINCT movieid 
      FROM casting JOIN movie ON movie.id = movieid 
        WHERE title = 'Alien');

-- Soln8
-- List the films in which 'Harrison Ford' has appeared
-- QUERY 👇:
SELECT DISTINCT title 
  FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid 
    WHERE name = 'Harrison Ford';

-- Soln9
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
-- QUERY 👇:
SELECT DISTINCT title 
  FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid 
    WHERE name = 'Harrison Ford' AND NOT ord = 1;

-- Soln10
-- List the films together with the leading star for all 1962 films.
-- QUERY 👇:
SELECT title, name 
  FROM  movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid 
    WHERE ord = 1 AND yr = 1962;

-- Soln11
-- Which were the busiest years for 'Rock Hudson', 
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies.
-- QUERY 👇:
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1
ORDER BY COUNT(title) DESC
LIMIT 2;


-- Soln12
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in
-- QUERY 👇:
SELECT title, name FROM movie JOIN casting ON (movie.id =movieid AND ord = 1) JOIN actor ON actor.id = actorid WHERE movie.id IN (
 SELECT movieid FROM casting
  WHERE actorid IN (
   SELECT id FROM actor
    WHERE name='Julie Andrews'));

-- Soln13
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
-- QUERY 👇:
SELECT name FROM casting JOIN actor ON actor.id = actorid WHERE ord = 1 GROUP BY name HAVING SUM(ord) >= 15;
-- Soln14
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
-- QUERY 👇:
SELECT title, COUNT(actorid) AS No_of_actors 
  FROM movie JOIN casting ON movie.id = movieid 
    WHERE yr = 1978 
      GROUP BY title, yr 
        ORDER BY COUNT(actorid) DESC, title;

-- Soln15
-- List all the people who have worked with 'Art Garfunkel'.
-- QUERY 👇:
SELECT name 
  FROM actor JOIN casting ON actorid = actor.id 
    WHERE movieid IN (
      SELECT movieid 
        FROM actor JOIN casting ON actor.id = actorid 
          WHERE name = 'Art Garfunkel'
    ) 
    AND name <> 'Art Garfunkel';

--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                                  QUIZ solutions
--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- Soln1
-- Select the statement which lists the unfortunate 
-- directors of the movies which have caused financial loses (gross < budget)
-- SELECTION 👇:
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget;

-- Soln2
-- Select the correct example of JOINing three tables
-- SELECTION 👇:
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- Soln3
-- Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted
-- SELECTION 👇:
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC;

-- Soln4
-- Select the result that would be obtained from the following code:
 SELECT title 
   FROM movie JOIN casting ON (movieid=movie.id)
              JOIN actor   ON (actorid=actor.id)
  WHERE name='Paul Hogan' AND ord = 1;
-- RESULT 👇:
-- Table-B
-- "Crocodile" Dundee
-- Crocodile Dundee in Los Angeles
-- Flipper
-- Lightning Jack

-- Soln5
-- Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351
-- SELECTION 👇:
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351;

-- Soln6
-- There are two sensible ways to connect movie and actor. They are:
-- ANSWER 👇:
-- link the director column in movies with the primary key in actor
-- connect the primary keys of movie and actor via the casting table

-- Soln7
-- Select the result that would be obtained from the following code:
 SELECT title, yr 
   FROM movie, casting, actor 
  WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3;
-- SELECTION 👇:
-- Table-B
-- A Bronx Tale	1993
-- Bang the Drum Slowly	1973
-- Limitless	2011

