#!/bin/bash

# while IFS="," read f1 f2 f3
# do
#   echo $f1
#   echo $f2
#   echo $f3
# done < file_name.csv

echo "Using normal while loop"
while IFS="," read id name age
do
  echo "$id $name $age"
done < test.csv

echo "Using awk"
echo "id name age"
awk 'NR>1' test.csv | while IFS="," read id name age
do
  echo "$id $name $age"
done
