#!/bin/zsh

#Script to show how to use variables

a=10
name="Shree Krishna"
age=24

echo "My name is $name and age is $age"

name="Mykks32"

echo "My name is $name and age is $age"

#Var to store the output of a command
HOSTNAME=$(hostname)
echo "Name of this machine is $HOSTNAME"

#Constant Value
readonly COLLEGE_NAME="ERC"

echo "My college name is ${COLLEGE_NAME}"