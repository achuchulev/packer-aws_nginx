#!/usr/bin/env bash

killall apt apt-get
rm /var/lib/apt/lists/lock
rm /var/cache/apt/archives/lock
rm /var/lib/dpkg/lock*
dpkg --configure -a
apt update -y

echo "Installing nginx...."

apt install -y nginx