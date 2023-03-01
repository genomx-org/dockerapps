#!/usr/bin/csh
#Add genomx group
groupadd -g `getent group genomx | cut -d: -f3` genomx

#Users 
pwd=$(pwd)
foreach line (`cat pwd/users`)
  set split = ($line:as/,/ /)
  set name = $split[1] 
  set id = $split[2]
  set password = $split[3]

  useradd $name -u $id -M -N --groups genomx #--comment "Paulina Baca <paulinabacap@gmail.com>"
  echo $name:$password | chpasswd