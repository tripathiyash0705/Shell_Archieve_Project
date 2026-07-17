#!/bin/bash

# Make sure script should be used by a root or sudo user.

if [[ ${UID} -ne 0 ]]
then 
	echo "Permission denied!! : Only root users can take this step."
	exit 1
fi

# Taking user name as input from the root user.
read -p "Enter the User Name :" USER_NAME
echo "$USER_NAME"

# Initialzing the password to be set to the newly created user.
PASSWORD=$(date +%s%M)

# Creating the new user

useradd -m  $USER_NAME

# Checking if the user is created or not.

if [[ $? -nt 0 ]]
then 
	echo " User not created"
	exit 1
fi

# Setting password 

echo $PASSWORD | passwd --stdin $USER_NAME

# Checking if password is set or not.

if [[ $? -nt 0 ]]
then
	echo "Password not set."
	exit 1
fi

# Forcing the user to change the password after first login.

passwd -e $USER_NAME

echo "UserName: $USER_NAME"
echo "PassWord: $PASSWORD"
echo "HostName: $(hostname)"
