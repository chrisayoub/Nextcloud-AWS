# Nextcloud-AWS

This repo includes Terraform files and a deploy script to get a running instance of Nextcloud on AWS, including automatic regular snapshots and DNS.

+ Run Terraform
+ Update NS in Namecheap with outputs
+ SSH into the created instance
+ Export environment variables for `email` and `domain`
+ Run commands in `install.sh`
+ Setup admin account
+ Configure 2FA for admin
+ Configure email server under `Administration` -> `Additional settings`
    + SMTP info from AWS SES (us-east-1, N. Virgina)
    + Add own email address as verified
+ Visit `www` subdomain and add as trusted domain

