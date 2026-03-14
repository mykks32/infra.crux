#!/bin/bash

# addition() {
#   local num1=$1
#   local num2=$2
#   let sum=$num1+$num2
# echo "Sum of $num1 and $num2 is $sum"
# }
# ---------------------
# addition 12 13

function welcomeNote {
  echo "-------------"
  echo "Welcome $1"
  echo "Age is $2"
  echo "-------------"
}

welcomeNote Shree 24
welcomeNote Krishna 25