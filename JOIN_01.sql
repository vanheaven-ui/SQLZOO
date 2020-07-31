--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                 TUTORIAL
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln 1
-- show the matchid and player name for all goals scored by Germany. 
-- QUERY 👇:
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- Soln 2
-- Show id, stadium, team1, team2 for just game 1012
-- QUERY 👇:
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012;

-- Soln 3
-- show the player, teamid, stadium and mdate for every German goal.
-- QUERY 👇:
SELECT player,teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER';

-- Soln 4
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
-- QUERY 👇:
SELECT team1, team2, player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE 'Mario%';

-- Soln 5
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
-- QUERY 👇:
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON goal.teamid = eteam.id WHERE gtime<=10;

-- Soln 6
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- QUERY 👇:
SELECT mdate, teamname FROM game JOIN eteam ON (game.team1 = eteam.id) WHERE eteam.coach = 'Fernando Santos';

-- Soln 7
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
-- QUERY 👇:
SELECT player from goal JOIN game ON game.id = goal.matchid WHERE game.stadium = 'National Stadium, Warsaw';

-- Soln 8
-- show the name of all players who scored a goal against Germany.
-- QUERY 👇:
SELECT DISTINCT player FROM goal JOIN game ON game.id = goal.matchid WHERE (game.team1 = 'GER' OR team2 = 'GER') AND NOT teamid = 'GER';

-- Soln 9
-- Show teamname and the total number of goals scored.
-- QUERY 👇:
SELECT teamname, COUNT(gtime) AS goals FROM goal JOIN eteam ON eteam.id = goal.teamid GROUP BY teamname;

-- Soln 10
-- Show the stadium and the number of goals scored in each stadium.
-- QUERY 👇:
SELECT stadium, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid GROUP BY stadium;

-- Soln 11
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
-- QUERY 👇:
SELECT DISTINCT matchid, mdate, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;

-- Soln 12
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
-- QUERY 👇:
SELECT matchid, mdate, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid WHERE goal.teamid = 'GER' GROUP BY matchid, mdate;

-- Soln 13
-- List every match with the goals scored by each team as shown
-- QUERY 👇:
SELECT mdate, 
  team1, 
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
  team2, 
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2 
    FROM game JOIN goal ON matchid = id 
      GROUP BY mdate, team1, team2, teamid 
        ORDER BY  mdate, matchid, team1, team2;

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                 QUIZ
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- soln1
-- You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
--          SELECTION 👉:- game  JOIN goal ON (id=matchid)

-- soln2
-- You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
-- 👉 matchid, teamid, player, gtime, id, teamname, coach

-- soln3
-- Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
-- SELECTION 👇:
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid;

-- soln4
-- Select the result that would be obtained from this code:
SELECT DISTINCT teamid, mdate
  FROM goal JOIN game on (matchid=id)
 WHERE mdate = '9 June 2012';
--    RESULT 👇
-- DEN	9 June 2012
-- GER	9 June 2012

-- soln5
-- Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
-- SELECTION 👇:
SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL';

-- soln6
-- Select the code which shows the player, their team and the time they scored, 
-- for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
-- SELECTION 👇:
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));
                                                 
-- soln7
--  Select the result that would be obtained from this code:
SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON teamid = id
 GROUP BY teamname
HAVING COUNT(*) < 3
-- SELECTION 👇:
-- Netherlands	2
-- Poland	2
-- Republic of Ireland	1
-- Ukraine	2
