# Nextcloud-AWS

This repo includes Terraform files and a deploy script to get a running instance of Nextcloud on AWS, including automatic regular snapshots and DNS.

+ Run Terraform
+ Update NS in Namecheap with outputs
+ SSH into the created instance
+ Export environment variables for `email` and `domain`
+ Run commands in `install.sh`
+ 