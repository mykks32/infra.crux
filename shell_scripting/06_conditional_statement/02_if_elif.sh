#!/bin/bash

read -p "Enter your Marks: " marks

if [[ $marks -ge 80 ]]
then
  echo "First Division"
elif [[ $marks -ge 60 ]]
then
  echo "Second Division"
else
  echo "Fail"
fi
