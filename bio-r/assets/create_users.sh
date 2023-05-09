#!/bin/bash
while IFS="," read -r username id password comment groups
do
  ./create_user.sh "$username"  "$id" "$password" "$comment" "$groups"
 # echo "$groups" | cut -d $'\t' -f1
done < users
