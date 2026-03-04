#!/bin/bash

# ---------------
# Requirement
# ---------------
# Script should be executed with root user else exit with status 1 and error message
# Script will take 1st argument as user and rest will be treated as comment
# Auto generate password for that user
# Upon successful execution of script, display the following
# username: <username>
# password: <auto_generated_password>
# host: <host_name>

# ---------------
# Steps
# ---------------
# Check if the script is being executed with superuser privileges.
# if the user doesn't supply at least one argument, then give them help.
# The first parameter is the user name.
# the rest of the parameters are for the comments.
# Generate a password.
# Create the user with the password.
# Check to see if the useradd command succeeded
# set the password
# Check to see if the passwd command succeeded
# Force password change on first login
# Display the username, password, and the host where the user is created


# Script should be execute with sudo/root access
if [[ "${UID}" -ne 0 ]]
then
  echo "Please run with sudo or root"
  exit 1
fi
# User should provide at least one argument as username else guide him
if [[ "${#}" -lt 1 ]]
then
  echo "Usage: ${0} USER_NAME [COMMENT]..."
  echo "Create a user with name USER_NAME and comment field of COMMENT"
  exit 1
fi

# Store 1st argument as user name
USER_NAME="${1}"
echo "$USER_NAME"

# In case of more than one argument, store it as account comment.
shift
COMMENT="${*}"

echo "$COMMENT"


# Create a password
PASSWORD=$(date +%s%N)

echo "$PASSWORD"


# Create the user
useradd -c "$COMMENT" -m "$USER_NAME"

# Check if user is successfully created or not
# shellcheck disable=SC2181
if [[ $? -ne 0 ]]
then
  echo "The Account could not be created"
  exit 1
fi

# Set the password for the user
passwd "$PASSWORD" "$USER_NAME"

# Check if password is successfully set or not
# shellcheck disable=SC2181
if [[ $? -ne 0 ]]
then
  echo "Password could not be set"
  exit 1
fi

# Force password change on first login
passwd -e "$USER_NAME"

# Display the username, password and the host where it is created
echo
echo "Username: $USER_NAME"
echo "password: $PASSWORD"
echo
echo "hostname: $(hostname)"
