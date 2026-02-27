#!/bin/zsh

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
# shellcheck disable=SC2296
echo "Upper of the myVar is ${(U)myVar}"

# shellcheck disable=SC2296
echo "Lower Case of the myVar is ${(L)myVar}"