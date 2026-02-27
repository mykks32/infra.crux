#!/bin/bash

# Using While loop
# Syntax
# while [ condition ]
# do
#     commands
# done

count=0
num=10

while [[ $count -le $num ]]
do
  echo "Numbers are $count"
  ((count++))
done