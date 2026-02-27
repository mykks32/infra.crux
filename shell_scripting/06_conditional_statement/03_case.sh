#!/bin/bash

echo "Hey choose an option"
echo "a = To see the current date"
echo "b = list all the files in current dir"
echo "c = to check the current location"

# Read the choice
read choice

case $choice in
  a)
    echo "Today Date is: "
    date
    echo "Ending......"
    ;;
  b) ls;;
  c) pwd;;
  *) echo "Not a valid input"
esac