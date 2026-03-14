#!/bin/bash

# exit status $? - gives you status of previous command if that was successful

# pwd -> /home/srikriydv
# echo $?
# 0 -> It means previous command was successful

# cd /root/
# bash: cd: /root/: Permission denied
# echo $?
# 1 -> It means previous command was unsuccessful

# Without -r, Bash may interpret \t as a tab.
read -r -p "Which site you want to check: " site

ping -c 1 "$site"
# sleep 5s

if [[ $? -eq 0 ]]
then
  echo "Successfully connected to $site"
else
  echo "Unable to connect to $site"
fi

