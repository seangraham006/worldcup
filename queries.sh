#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(WINNER_GOALS + OPPONENT_GOALS) FROM GAMES")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(WINNER_GOALS) FROM GAMES")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(WINNER_GOALS),2) FROM GAMES")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(WINNER_GOALS + OPPONENT_GOALS) FROM GAMES")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(WINNER_GOALS) FROM GAMES")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo  "$($PSQL "SELECT COUNT(*) FROM GAMES WHERE WINNER_GOALS > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo  "$($PSQL "SELECT NAME FROM GAMES FULL JOIN TEAMS ON GAMES.WINNER_ID = TEAMS.TEAM_ID WHERE ROUND='Final' AND YEAR=2018")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo  "$($PSQL "SELECT w.NAME as WINNER, o.NAME AS OPPONENT FROM GAMES FULL JOIN TEAMS AS w ON GAMES.WINNER_ID = w.TEAM_ID FULL JOIN TEAMS AS o ON GAMES.OPPONENT_ID = o.TEAM_ID WHERE ROUND='Eighth-Final' AND YEAR=2014")"

echo -e "\nList of unique winning team names in the whole data set:"
echo  "$($PSQL "SELECT DISTINCT(NAME) FROM TEAMS")"

echo -e "\nYear and team name of all the champions:"
echo  "$($PSQL "SELECT NAME,YEAR FROM GAMES FULL JOIN TEAMS ON GAMES.WINNER_ID = TEAMS.TEAM_ID WHERE ROUND='Final'")"

echo -e "\nList of teams that start with 'Co':"
echo  "$($PSQL "SELECT NAME FROM TEAMS WHERE NAME LIKE 'Co%'")"
