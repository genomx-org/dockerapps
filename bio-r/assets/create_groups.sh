#!/bin/bash
while IFS="," read -r groupname
do
   /tmp/create_group.sh "$groupname"
done < /tmp/groups
