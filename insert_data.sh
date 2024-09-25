#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games,teams")"

echo -e "\n~~ Inserting Data ~~\n"

while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    # check if winner team name already exists
    # if team name does not exist insert it into teams
    # get winner team_id
    # check if opponent team name already exists
    # if team name does not exist insert it into teams
    # get opponent team_id
    echo sup
    # insert into games VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)
  fi
done < games.csv
