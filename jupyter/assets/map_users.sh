#!/bin/bash  

# Users
echo ---
echo "Getting users at /tmp/users"
echo ---
while IFS="," read -r username id password comment
do
  echo "username: $username"
  echo "id: $id"
  echo "password: $password"
  echo "comment: $comment"
  # add and change pwd
  useradd "$username" -u "$id" --no-create-home --groups genomx --comment "$comment"
  echo "$username:$password" | chpasswd
done < /tmp/users
  