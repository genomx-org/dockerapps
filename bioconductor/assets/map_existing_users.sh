#!/bin/bash  
#Add genomx group
groupadd -g `getent group genomx | cut -d: -f3` genomx

#Users 
Lines = $(cat $PWD/users)
for Line in $Lines
do
  my_arr=($(echo $Line | tr ";""\n")) 

  ##set split = ($Line:as/,/ /)
  name = ${my_arr[0]} 
  id = ${my_arr[1]} 
  password = ${my_arr[2]} 

  useradd $name -u $id -M -N --groups genomx #--comment "Paulina Baca <paulinabacap@gmail.com>"
  echo $name:$password | chpasswd
done
  