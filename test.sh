echo -e "echo "shutdown (h) or restart (r) ?"\nread answer\nsudo shutdown -$answer now" > /usr/bin/off
sudo chmod 711 /usr/bin/off
