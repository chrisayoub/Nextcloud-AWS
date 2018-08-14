#!/usr/bin/env sh

sudo apt update && sudo apt -y upgrade

sudo snap install nextcloud

printf "y\n${email}\n${domain} www.${domain}\n" | sudo nextcloud.enable-https lets-encrypt

sudo nextcloud.occ app:enable encryption
sudo nextcloud.occ app:enable files_pdfviewer
sudo nextcloud.occ app:enable twofactor_totp

sudo nextcloud.occ encryption:enable
sudo nextcloud.occ background:cron

