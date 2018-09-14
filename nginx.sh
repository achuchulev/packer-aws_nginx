#!/usr/bin/env bash

# check if nginx is installed
# install nginx if it's not

# check if nginx is installed
which nginx || {
sudo apt-get update
sudo apt-get install -y nginx
}
