#!/bin/bash
groupname="$1"

# Create group
echo ---
echo "Creating group: $groupname"
groupadd "$groupname" --key GID_MIN=1101 --key GID_MAX=1999
echo ---
