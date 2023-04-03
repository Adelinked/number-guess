#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
# Number guess game

SECRET_NUMBER=$(( RANDOM % 1000+1))
echo "Enter your username:"
read USER_NAME  

PLAYER_GAMES=$($PSQL "select count(game_id) as games_played,min(tries) as best_game from users inner join games using(user_id) where user_name='$USER_NAME'")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")

echo "$PLAYER_GAMES" | while read GAMES_PLAYED BAR BEST_GAME 
do
  if [ $GAMES_PLAYED ] && [ $BEST_GAME ] 
  then  
    echo -e "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
    if [[ -z $USER_ID ]]
    then
      INSERT_USER_RESULT=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME')") 
    fi
  fi  
done

if [[ -z $USER_ID ]]
then
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME'")
fi

TRIES=0
GUESSED=0
echo "Guess the secret number between 1 and 1000:"
while (( $GUESSED == 0 ))
do
  read USER_NUMBER
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]] 
  then
    echo "That is not an integer, guess again:"
  else 
    ((TRIES++))
    if (( $USER_NUMBER == $SECRET_NUMBER ))
    then
      echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id,tries) VALUES($USER_ID,$TRIES)") 
      GUESSED=1
      elif (( $USER_NUMBER > $SECRET_NUMBER ))
      then
        echo "It's lower than that, guess again:"
      else 
        echo "It's higher than that, guess again:"
      fi
    fi
  
done

  