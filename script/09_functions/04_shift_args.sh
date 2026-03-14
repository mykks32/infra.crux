#!/bin/bash

# SHIFT
# When we pass multiple arguments, we can shift

# A B C
# shift
# B C

# To create a user, provide username and description
# To be called with
# ❯ bash 04_shift_args.sh "shree Krishna Yadav" "he is a boy"
echo "Creating user"

echo "Username is $1"
echo "Description is $2"

# OR
# To be called with
# ❯ bash 04_shift_args.sh "shree Krishna Yadav" "he is a boy" hello how are you
shift
echo "Left is $*"