#!/bin/bash
username="$1"
id="$2"
password="$3"
commentary="$4"
groups="$5"

#Create user
echo ---
echo "Creating user: $username"
groupadd -g "$id" "$username"
useradd "$username" -u "$id" -g "$id" -m --comment "$comment"
echo "$username:$password" | chpasswd

#Add user to groups

# Guarda el valor original de IFS
OLDIFS=$IFS

# Establece IFS como el caracter de tabulación
IFS=$'\t'

# Itera sobre los valores separados por tabulación
for group in $groups
do
   usermod -a -G $group "$username"  
done

# Restablece el valor original de IFS
IFS=$OLDIFS
echo ---

