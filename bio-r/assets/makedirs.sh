#!/bin/bash
# Create dirs from listdirs file
#USERNAME=gen
while IFS="," read -r GROUP DIR GROUPACL OTHERACL
do
  mkdir -p "$DIR"
  chgrp "$GROUP" "$DIR"
 # chown "$USERNAME":"$GROUP" "$DIR"
  chmod 2770 "$DIR"
  setfacl -d -m g::"$GROUPACL" "$DIR"
  setfacl -d -m o::"$OTHERACL" "$DIR"
  mkdir "$DIR/Projects"
done < /tmp/listdirs

#chown "$USERNAME":"$USERNAME" /orgs
#chmod 700 /orgs
