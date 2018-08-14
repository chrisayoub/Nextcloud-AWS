provider "aws" {
  region = "us-east-1"
  alias  = "east-1"
}

resource "aws_ses_domain_identity" "email" {
  domain = "${var.domain}"

  provider = "aws.east-1"
}

resource "aws_route53_record" "verification_record" {
  zone_id = "${aws_route53_zone.public.zone_id}"
  name    = "_amazonses.${aws_ses_domain_identity.email.id}"
  type    = "TXT"
  ttl     = "600"
  records = ["${aws_ses_domain_identity.email.verification_token}"]

  provider = "aws.east-1"
}
