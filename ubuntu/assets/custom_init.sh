#!/bin/bash  

# Users
echo ---
echo "Getting users at /tmp/users"
echo ---
while IFS="," read -r username id password comment
do
  echo "Creating user. username: $username"
  groupadd -g "$id" "$username"
  useradd "$username" -u "$id" -g "$id" --no-create-home --groups genomx --comment "$comment"
  echo "$username:$password" | chpasswd
done < /tmp/users

# Installing The Littlest JupyterHub
##curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin gen --show-progress-page
wget --output-document - https://tljh.jupyter.org/bootstrap.py | python3 - --admin gen --show-progress-page