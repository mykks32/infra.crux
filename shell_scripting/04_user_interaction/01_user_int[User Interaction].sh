#!/bin/bash

# User Interaction
# Direct read
echo "What is your name?"
read name
echo "Your name is $name"

# With variabel
read -p "What is your name? " newName
echo "Your name is $newName"