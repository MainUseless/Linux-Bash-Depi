#!/bin/bash
users=$(awk -F: '{print $1}' /etc/passwd)

echo "Users on the system:"
echo "$users"

for user in $users; do
    echo "Sending mail to $user"
    mail -s "Hello $user from $USER" $user < /dev/null
done