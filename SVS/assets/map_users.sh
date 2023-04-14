#!/bin/bash  

# Users
echo ---
echo "Getting users at /tmp/users"
echo ---
USER=gen
HOME=/home/$USER
groupadd -g 1100 genomx
useradd -u 1101 --create-home --shell /bin/bash --user-group --groups adm,genomx,sudo $USER
echo $USER:ubuntu | chpasswd
cp -r /root/{.config,.gtkrc-2.0,.asoundrc} ${HOME}
chown -R $USER:$USER ${HOME}
[ -d "/dev/snd" ] && chgrp -R adm /dev/snd
sed -i -e "s|%USER%|$USER|" -e "s|%HOME%|$HOME|" /etc/supervisor/conf.d/supervisord.conf

# home folder
if [ ! -x "$HOME/.config/pcmanfm/LXDE/" ]; then
    mkdir -p $HOME/.config/pcmanfm/LXDE/
    ln -sf /usr/local/share/doro-lxde-wallpapers/desktop-items-0.conf $HOME/.config/pcmanfm/LXDE/
    chown -R $USER:$USER $HOME
fi

while IFS="," read -r username id password comment
do
  echo "Creating user. username: $username"
  groupadd -g "$id" "$username"
  useradd "$username" -u "$id" -g "$id" --no-create-home --groups genomx --comment "$comment"
  echo "$username:$password" | chpasswd
done < /tmp/users
  