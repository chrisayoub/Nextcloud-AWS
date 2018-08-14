#!/usr/bin/env sh

sudo apt update && sudo apt -y upgrade

sudo snap install nextcloud

printf "y\n${email}\n${domain} www.${domain}\n" | sudo nextcloud.enable-https lets-encrypt