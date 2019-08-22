#!/bin/bash

#set variables
echo "what is your username?"
read NAME

#set hostname
apt update
apt install sudo ranger net-tools python3-pip open-ssh ufw openvpn

#add user to sudo group
usermod -aG sudo $NAME

#set up fw
echo -e "would you like to allow ssh through your firewall?\n(y/n)"
read fw_answer
if [ "$fw_answer" == "y" ]
then
  sudo ufw allow OpenSSH
  sudo ufw enable
elif [ "$fw_answer" == "n" ]
then
  echo "not allowing ssh"
  sudo ufw enable
else
  echo "'y' not selected, not allowing ssh"
  sudo ufw enable
fi

#install easy-rsa
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.6/EasyRSA-unix-v3.0.6.tgz && cd ~/
tar xvf EasyRSA-unix-v3.0.6.tgz
