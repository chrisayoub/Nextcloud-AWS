provider "aws" {
  region  = "${var.region}"
  version = "~> 1.31"
}

variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "nextcloud"
}

variable "domain" {}

terraform {
  backend "s3" {
    bucket = "cayoub-terraform-remote-state"
    key    = "nextcloud"
    region = "us-east-2"
  }
}
