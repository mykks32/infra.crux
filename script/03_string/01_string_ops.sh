#!/bin/bash

myVar="Hello Buddy, How are You?"
#length=${#myVar}
#upper=${x^^}
#lower=${y,,}
#replace=${myVar/World/Buddy}
#slice=${myVar:6:11}

# Length calculation
myVarLength=${#myVar}
echo "Length of the myVar is $myVarLength"

# Make variable uppercase/lowercase
echo "Upper of the myVar is ${myVar^^}"
echo "Lower Case of the myVar is ${myVar,,}"

# Replace string from another string
newVar=${myVar/Buddy/Shree}
echo "New Var is --- $newVar"

# To Slice a string
echo "After slice ${myVar:6:5}"