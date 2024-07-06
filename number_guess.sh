#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read INPUT

#Retrieve user
USER_EXIST=$($PSQL "SELECT name FROM players WHERE name='$INPUT'")

if [[ -z $USER_EXIST ]]
then
  #Insert user if user doesn't exist in the table
  INSERT_NAME=$($PSQL "INSERT INTO players(name) VALUES('$INPUT')")
  echo -e "\nWelcome, $INPUT! It looks like this is your first time here."
else
  #print details about the user if user exists in the table
  TOTAL_GAMES=$($PSQL "SELECT COUNT(*) FROM games JOIN players USING(player_id) WHERE name='$INPUT'")
  BEST_GAME=$($PSQL "SELECT MIN(num_guesses) FROM games JOIN players USING(player_id) WHERE NAME='$INPUT'")
  echo -e "\nWelcome back, $INPUT! You have played $TOTAL_GAMES games, and your best game took $BEST_GAME guesses."
fi





