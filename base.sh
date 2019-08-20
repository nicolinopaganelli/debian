#!/bin/bash

su

#set variables
echo "what is your username?"
read NAME

#add user to sudo group
usermod -aG sudo $NAME

#set hostname
apt update
apt install ranger net-tools python3-pip
