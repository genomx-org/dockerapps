#!/bin/bash 
#Users-guests
for i in {2001..2050}
do
  	echo "Creating user user: user$i"
  	groupadd -g "$i" "usuario$i"
        useradd "usuario$i" -u "$i" -m -g "$i" --groups public
        echo "usuario$i:workshop$i" | sudo chpasswd
	echo "user$i created"
done

# public permissions
chown -R rstudio:public /public
chmod -R 650 /public
# apps permissions
chown -R rstudio:genomx /apps
chmod -R 610 /apps
# data permissions
chown -R rstudio:public /data
chmod -R 550 /data
