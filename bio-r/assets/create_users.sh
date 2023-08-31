#!/bin/bash
while IFS="," read -r username password comment groups
do
   /tmp/create_user.sh "$username" "$password" "$comment" "$groups"
done < /tmp/users
