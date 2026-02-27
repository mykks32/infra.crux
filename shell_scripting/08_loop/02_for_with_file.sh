#!/bin/bash

# Getting values from a files README.md

FILE="/Users/rock/Desktop/infra.crux/shell_scripting/08_loop/name.txt"
for i in $(cat $FILE)
do
  echo "$i"
done
