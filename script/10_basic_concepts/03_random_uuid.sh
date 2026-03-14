#!/bin/bash

# RANDOM - A random integer between 0 and 32767 is generated
# UID - User ID of the user logged in

# Rolling a dice
roll_dice() {
  echo $(( RANDOM % 6 + 1 ))
}

echo "Dice rolled: $(roll_dice)"


# Checking if the user is root or not

if [[ $UID -eq 0 ]]
then
  echo "User is root $UID"
else
  echo "User is not root $UID"
fi