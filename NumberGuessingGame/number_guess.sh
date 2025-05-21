#!/bin/bash
# Number guessing game with database

# Query variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Username prompt
echo Enter your username:
read USERNAME

# Check user id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# If new user
if [[ -z $USER_ID ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  # Insert user into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # Get new user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Get game data
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

# Generate random number
SECRET=$(( $RANDOM % 1000 + 1 ))
# Prompt for guess
echo Guess the secret number between 1 and 1000:
read GUESS
GUESSES=1
while (( GUESS != SECRET ))
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif (( SECRET < GUESS ))
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
  read GUESS
  ((GUESSES++))
done

# Insert game into database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
# Print closing message
echo You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!