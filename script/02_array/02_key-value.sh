#!/bin/zsh

# Declare associative array
declare -A myArray

# Assign values
myArray=( [name]=Shree [age]=24 [city]=Janakpur )

# Access values
echo "Name is ${myArray[name]}"
echo "Age is ${myArray[age]}"
echo "City is ${myArray[city]}"