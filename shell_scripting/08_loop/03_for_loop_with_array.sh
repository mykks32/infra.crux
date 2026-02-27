#!/bin/bash

# Using array with for loop
myArray=( 1 2 3 4 5 Hello "Hello World" )

for(( i=0;i<${#myArray[*]};i++ ))
do
  echo "Value of Array is ${myArray[i]}"
done