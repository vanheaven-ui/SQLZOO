--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--       TUTORIAL
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Soln 1
-- show the matchid and player name for all goals scored by Germany. 
SELECT matchid, player FROM goal WHERE teamid = 'GER';

-- Soln 2
-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012;

-- Soln 3
-- show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER';

-- Soln 4
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player FROM game JOIN goal ON game.id = goal.matchid WHERE player LIKE 'Mario%';

-- Soln 5
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON goal.teamid = eteam.id WHERE gtime<=10;

-- Soln 6
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname FROM game JOIN eteam ON (game.team1 = eteam.id) WHERE eteam.coach = 'Fernando Santos';

-- Soln 7
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player from goal JOIN game ON game.id = goal.matchid WHERE game.stadium = 'National Stadium, Warsaw';

-- Soln 8
-- show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM goal JOIN game ON game.id = goal.matchid WHERE (game.team1 = 'GER' OR team2 = 'GER') AND NOT teamid = 'GER';

-- Soln 9
-- Show teamname and the total number of goals scored.
SELECT teamname, COUNT(gtime) AS goals FROM goal JOIN eteam ON eteam.id = goal.teamid GROUP BY teamname;

-- Soln 10
-- Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid GROUP BY stadium;

-- Soln 11
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT DISTINCT matchid, mdate, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;

-- Soln 12
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(gtime) FROM game JOIN goal ON game.id = goal.matchid WHERE goal.teamid = 'GER' GROUP BY matchid, mdate;

-- Soln 13
-- List every match with the goals scored by each team as shown