#!/bin/bash

su

#set variables
echo "what is your username?"
read NAME

#add user to sudo group
usermod -aG sudo $NAME

#set hostname
apt update
apt install ranger net-tools python3-pip open-ssh ufw

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
    
