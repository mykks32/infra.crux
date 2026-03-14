#!/bin/bash

# continue - to stop current iteration of loop and start new iteration

# Example of using continue in loop
# Suppose we only need to print odd no.

for i in {1..10}
do
  # Remainder check if it is zero to find odd number
  ((r=i%2))
  if [[ $r -eq 0 ]]
  then
    continue
  fi
  echo "Odd no. is $i"
done