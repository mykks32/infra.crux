#!/bin/bash

# break - to stop the loop

# Example of break in a loop
# We just need to confirm if a given no. if present or not

no=6

for i in {1..9}
do
  # Break the loop if no. found
  if [[ $no -eq $i ]]
  then
    echo "$no is found!!!!"
    break
  fi
  echo "Number is $i"
done