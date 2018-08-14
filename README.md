# Nextcloud-AWS

This repo includes Terraform files and a deploy script to get a running instance of Nextcloud on AWS, including automatic regular snapshots and DNS.

## Motivations

I am skeptical of the security of Dropbox, the service I previously used for cloud file-syncing. Plus, they dropped support for [encrypted ext4 partitions on Linux.](https://www.dropboxforum.com/t5/Syncing-and-uploads/Dropbox-client-warns-me-that-it-ll-stop-syncing-in-Nov-why/td-p/290058)

## Guide

+ Verify there is a SSH key `~/.ssh/id_rsa.pub`
+ `cd tf && terraform init && terraform apply` 
+ Update NS values in Namecheap with the outputs
+ SSH into the created instance at the given domain
+ Export environment variables for `email` and `domain`
+ Run the commands in `install.sh`
+ Setup admin account by visiting the domain
+ Configure 2FA for admin under settings
+ Configure email server under `Administration` -> `Additional settings`
    + SMTP info from AWS SES (us-east-1, N. Virgina)
    + Add own email address as verified
+ Visit `www` subdomain and add as trusted domain
+ Done! Add any app tokens to connect clients

