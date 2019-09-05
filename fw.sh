#!/bin/bash

#set up fw
echo -e "would you like to allow ssh through your firewall?\n(y/n)"
read fw_answer
if [ "$fw_answer" == "y" ]
then
  sudo ufw allow OpenSSH
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
  sudo ufw allow 443/tcp
elif [ "$fw_answer" == "n" ]
then
  echo "not allowing https"
else
  echo "'y' not selected, not allowing https"
fi

sudo ufw disable
sudo ufw enable
