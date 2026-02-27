#!/bin/bash

# Math Calculation
read -p "Enter the value of x & y: " x y

# Can be done using
# let a++ , let a=5*10 --> normal using let
# (()) --> another using
((mul=$x*$y))

echo "Multiply of the variable = $mul and division is $(($x/$y))"