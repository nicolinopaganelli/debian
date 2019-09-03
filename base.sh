#!/bin/bash

#set variables
echo "what is your username?"
read NAME

#install base utilities
apt update
apt install sudo ranger net-tools python3-pip openssh-server openssh-client ufw openvpn mlocate vim

#add user to sudo group
sudo usermod -aG sudo $NAME

#set up fw
echo -e "would you like to allow ssh through your firewall?\n(y/n)"
read fw_answer
if [ "$fw_answer" == "y" ]
then
  sudo ufw allow OpenSSH
  sudo ufw allow 22
elif [ "$fw_answer" == "n" ]
then
  echo "not allowing ssh"
else
  echo "'y' not selected, not allowing ssh"
fi

echo -e "would you like to allow https (port 443) through your firewall?\n(y/n)"
read fw_answer
if [ "$fw_answer" == "y" ]
then
  sudo ufw allow openvpn
  sudo ufw allow 443
elif [ "$fw_answer" == "n" ]
then
  echo "not allowing vpn"
else
  echo "'y' not selected, not allowing vpn"
fi

sudo ufw enable

#install easy-rsa
wget -P /home/$NAME/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz && cd /home/$NAME/
tar xvf EasyRSA-unix-v3.0.6.tgz
