#!/bin/bash
username="$1"
password="$2"
commentary="$3"
groups="$4"

#Create user
echo ---
echo "Creating user: $username"
useradd "$username" --key UID_MIN=2001 --key UID_MAX=2999 --key GID_MIN=2001 --key GID_MAX=2999 --key PASS_MAX_DAYS=5 --key PASS_WARN_AGE=1 --create-home --user-group --shell /bin/fish --comment "$comment"
echo "$username:$password" | chpasswd

#Add user to groups

# Guarda el valor original de IFS
OLDIFS=$IFS

# Modifica el IFS con el valor de "/"
IFS=$'/'

# Itera sobre los valores separados por "/"
for group in $groups
do
   usermod -a -G $group "$username"  
done

# Restablece el valor original de IFS
IFS=$OLDIFS
echo ---

