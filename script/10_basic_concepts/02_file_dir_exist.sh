#!/bin/bash

# if [ -d folder_name ] If folder exists
# [ ! -d folder_name ] If folder not exists

# if [ -f file_name ] If file exists
# if [ ! -f file_name ] if file not exists

FILEPATH="/Users/srikriydv/Desktop/er-diagrams.pdf"

if [[ -f $FILEPATH ]]
then
  echo "File exists"
else
  echo "File not found"
  exit 1
fi