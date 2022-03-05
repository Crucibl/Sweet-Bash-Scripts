#!/bin/bash

USERNAME=$2
PASSWORD=$3
addUser()

{
if [ -z $3]
then
  PASSWORD=$(date+%s | sha256sum | base64 | head -c 32)
fi


echo "Welcome to the party $USERNAME" >> credentials.txt
echo "" >> credentials.txt
echo "username: $USERNAME" >> credentials.txt
echo "password: $PASSWORD" >> credentials.txt

useradd -m $USERNAME

echo $USERNAME:$PASSWORD | chpasswd
echo $USERNAME has joined the party

mail -A ./credentials.txt -s "Party" "$USERNAME@party.com" < /dev/null

rm -rf credentials.txt

cp rules.txt /home/$USERNAME/

echo "$USERNAME has joined the party"
}

deleteUser()
{
    userdel -r $USERNAME
    echo "Bye $USERNAME"
}

if [ $1 == "add" ]
then
   addUser
elif [ $1 == "remove" ]
then
   deleteUser
else
   echo "Specify either [add] or [remove]"
fi