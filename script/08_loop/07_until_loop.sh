#!/bin/bash

# Syntax:
# until [ condition ]
# do
#   commands
# done
# The loop runs until the condition becomes true (opposite of while)

# Simple Until Loop
count=1
echo "Printing until loop"

until [ $count -gt 5 ]
do
  echo "Count is $count"
  ((count++))
done

# Until Loop with array
names=("Hari" "Ram" "Shyam")

index=0
echo "Printing from Array"

until [ $index -ge ${#names[*]} ]
do
  echo "Name: ${names[$index]}"
  ((index++))
done

# Until loop with file
FILE="/Users/rock/Desktop/infra.crux/shell_scripting/08_loop/name.txt"
i=1
echo "Printing from file name.txt"

until [ $i -gt $(wc -l < "$FILE") ]
do
    # Get the ith line from the file
    name=$(sed -n "${i}p" "$FILE")

    # Print the line
    echo "Name: $name"

  # Increment the counter
  ((i++))
done