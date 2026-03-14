#!/bin/bash

# While loop with array
myArray=(apple banana mango)

index=0
length=${#myArray[@]}

while [ $index -lt $length ]
do
  echo "Fruit: ${myArray[$index]}"
  ((index++))
done