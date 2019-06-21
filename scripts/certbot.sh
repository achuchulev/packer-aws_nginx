#!/usr/bin/env bash

killall apt apt-get
rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock*
dpkg --configure -a
apt update

echo "Installing Certbot...."

apt install software-properties-common -y
add-apt-repository universe
add-apt-repository ppa:certbot/certbot -y
apt update
apt install python-certbot-nginx -y
