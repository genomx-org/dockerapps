#!/bin/bash  
# Groups
groupadd -g 1100 genomx
groupadd -g 2000 public

#gen-->rstudio
usermod -u 1101 -a -G genomx,public rstudio
groupmod -g 1101 rstudio
# Users-genomx,guests
echo ---
echo "Getting users at /tmp/users"
echo ---
while IFS="," read -r username id password comment
do
  echo "Creating user. username: $username"
  groupadd -g "$id" "$username"
  useradd "$username" -u "$id" -g "$id" --no-create-home --groups genomx,public --comment "$comment"
  echo "$username:$password" | chpasswd
done < /tmp/users

