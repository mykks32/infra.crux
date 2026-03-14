#!/bin/bash

# While loop with file
while read myVar
do
  echo "Name: $myVar"
done < name.txt