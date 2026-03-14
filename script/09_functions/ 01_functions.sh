#!/bin/bash

# function myFun {
#     echo "Hi"
# }
# OR
# myFun() {
#   echo "Hello"
# }
# To call a function
# myFun

function welcomeNote {
  echo "---------"
  echo "Welcome"
  echo "---------"
}

# To call our function
for (( i=0; i<4; i++ )); do
  welcomeNote
done

