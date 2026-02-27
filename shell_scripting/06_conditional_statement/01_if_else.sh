#!/bin/bash

read -p "Enter your marks: " marks

# Equal --> -eq/==
# Greater than equal to --> -ge
# less the or equal to --> -le
# Not Equal ---> -ne/!=
# GreaterThan ---> -gt
# LessThan ---> -lt
if [[ $marks -gt 40 ]]
then
  echo "You are pass"
else
  echo "You are fail"
fi
