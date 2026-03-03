#!/bin/bash

# exit - to stop script at a point

# To access the arguments

if [[ $# -eq 0 ]]
then
  echo "Please provide at least one arguments"
  exit 1
fi

echo "First argument is $1"
echo "Second argument is $2"

echo "All the arguments are - $*"
echo "Number of arguments are - $#"

# For loop to access the values from arguments

for filename in "$@"
do
  echo "Coping file -f $filename"
done