#!/bin/sh

# Config and start NGINX Server

set -ex

apt-get update -y
apt-get install certbot apache2-utils -y
htpasswd -bc /etc/nginx/.htpasswd elk elk123
nginx -g 'daemon off;'
