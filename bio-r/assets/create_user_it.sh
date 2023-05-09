#!/bin/bash
read -p "Enter username : " username
read -s -p "Enter password : " password
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
  	echo "$username exists"
   	exit 1
else	
	last_id=$(awk -F ':' '{print $3}' /etc/passwd | grep "^11"|sort | tail -n 1)  
	new_id=$(($last_id + 1))
	groupadd -g "$new_id" "$username"

	useradd "$username" -u "$new_id" -g "$new_id" -m 
	echo "$username:$password" | chpasswd

	echo "Available groups:"
        groups=$(cut -d: -f1,3 /etc/group | awk -F: '$2 ~ /00$/ {print $1}')
	OLDIFS=$IFS
	IFS=$'\n' read -d '' -ra groups_arr <<< "$groups"
	IFS="$OLDIFS"

	for ((i=0; i<${#groups_arr[@]}; i++)); 
	do
		echo "$((i+1)): ${groups_arr[i]}"
	done
	

	while true
	do
		echo "According to the previous number, choose which groups you want to be part of (exit -1)"
		read -p "Group : " option
                if [$option -eq -1 ]
		then
			break
		else
			group=${groups_arr[option-1]}
			if [ -z "$group" ]
		       	then
   				echo "Wrong number"
			else
				if groups "$username" | grep -q "\b$group\b"
			       	then
  					echo "$username is already on $group"
				else
					echo "$username succesfully added to $group"
   					usermod -a -G "$group" "$username"
				fi
			fi
		fi
	done

	echo "User created"

fi
