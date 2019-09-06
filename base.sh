#!/bin/bash

#set variables
echo "what is your username?"
read NAME

#install base utilities
apt update
apt install sudo ranger net-tools python3-pip openssh-server openssh-client ufw openvpn mlocate vim

#add user to sudo group
sudo usermod -aG sudo $NAME

#install easy-rsa
wget -P /home/$NAME/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz && cd /home/$NAME/
tar xvf EasyRSA-unix-v3.0.6.tgz

#create simple shutdown + reboot command
echo -e "echo 'shutdown (h) or restart (r) ?'\nread answer\nsudo shutdown -\$answer now" > /usr/bin/off
sudo chmod 711 /usr/bin/off
sudo chown $NAME /usr/bin/off
