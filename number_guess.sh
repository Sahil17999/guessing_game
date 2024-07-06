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

#Random number between 1 and 1000
SECRET_NUM=$(($RANDOM % 1000 + 1))

#Keep track of number of guesses
GUESS_TRACKER=1
echo -e "\nGuess the secret number between 1 and 1000:"

#prompt the user until guess is correct.
while read GAME_INPUT
do
  #Guess must be a number.
  if [[ ! $GAME_INPUT =~ ^[0-9]+$ ]]
  then 
    echo -e "\nThat is not an integer, guess again:"

  #Make adequate prompt that informs user if their guess is lower or higher from the threshold.
  else 
    if [[ $GAME_INPUT -eq $SECRET_NUM ]]
    then
      break
    else
      if [[ $GAME_INPUT -gt $SECRET_NUM ]]
      then 
        echo -e "\nIt's lower than that, guess again:"
      elif [[ $GAME_INPUT -lt $SECRET_NUM ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      fi
    fi
  fi

#After each time we take input from user we add to the number of guesses
((GUESS_TRACKER++))
done

#Inform user that they made the correct guess with info.
echo "You guessed it in $GUESS_TRACKER tries. The secret number was $SECRET_NUM. Nice job!"

#Update games table with the player id and number of guesses it took.
PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name='$INPUT'")
INSERT_GAME=$($PSQL "INSERT INTO games(player_id, num_guesses) VALUES($PLAYER_ID, $GUESS_TRACKER)")






