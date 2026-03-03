#!/bin/bash

# myscript.sh arg1 arg2...
# How to access these arguments inside out scripts?

# To get no. of arguments : $#
# To display all arguments : $@
# To use or display a arguments: $1 $2 ..

# To access the arguments
# To be called with bash 03_args.sh arg1 arg2

echo "First argument is $1"
echo "Second argument is $2"

echo "All the arguments are - $*"
echo "No of arguments are - $#"

# For loop to access the values from arguments
i=1
for age in "$@"
do
  echo "Argument $i is $age"
  ((i++))
done
