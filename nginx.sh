#!/usr/bin/env bash

# check if nginx is installed
# install nginx if it's not

which nginx || {
sudo yum update
sudo yum install epel-release
sudo yum install nginx
}
