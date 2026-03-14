#!/bin/bash
#Array
# Definition
myArray=( 1 20 30.5 Hello "Hey Buddy!" )

# ALl array printing using wildcard
echo "All the values in array are ${myArray[*]}"

# Specific index
echo "Value of 3rd Index is ${myArray[2]}"

# How to find no. of values in the array
# --> to find length of the array
echo "No. of values, length of an array is ${#myArray[*]}"

# Get Specific values in a array
echo "Array from 1 ${myArray[*]:1}"
echo "Array from 1 to 2 ${myArray[*]:1:2}"

# Updating a array
myArray+=(new 25 30)

echo "New Array ${myArray[*]}"