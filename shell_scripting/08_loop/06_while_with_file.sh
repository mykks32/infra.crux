#!/bin/bash

# While loop with file
while read myVar
do
  echo "Name: $myVar"
done < "/Users/rock/Desktop/infra.crux/shell_scripting/08_loop/name.txt"