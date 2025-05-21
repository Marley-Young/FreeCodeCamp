#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
  # Check if argument is valid symbol
  ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol='$1'")
  # If not
  if [[ -z $ELEMENT_DATA ]]
  then
    # Check if argument is valid name
    ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE name='$1'")
    # If not
    if [[ -z $ELEMENT_DATA ]]
    then
      # Check valid atomic number
      ELEMENT_DATA=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number=$1")
      # If not
      if [[ -z $ELEMENT_DATA ]]
      then
        echo I could not find that element in the database.
        exit
      fi
    fi
  fi
  # Read element data
  echo $ELEMENT_DATA | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME
  do
    # Get property data
    PROPERTY_DATA=$($PSQL "SELECT type_id, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    # Read property data
    echo $PROPERTY_DATA | while read TYPE_ID BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      # Get type
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
      # Format type
      TYPE_FORMATTED=$(echo $TYPE | sed 's/ |/"/')
      # Print message
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_FORMATTED, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  done
else
  echo Please provide an element as an argument.
fi