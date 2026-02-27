#!/bin/bash

# AND operator

read -p "What is your age: " age
read -p "Your Country: " country
read -p "Are you a convict: " convict
read -p "Are you special true or false: " special

if [[ $age -ge 18 ]] && [[ $country == "nepal" ]] && [[ $convict == "no" ]] || [[ $special == "true" ]]
then
  echo "You can vote"
else
  echo "You can't vote"
fi