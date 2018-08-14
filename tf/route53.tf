# Route 53 Zone
resource "aws_route53_zone" "public" {
  name = "${var.domain}"
}

# Route 53 Rules
resource "aws_route53_record" "A" {
  zone_id = "${aws_route53_zone.public.id}"
  name    = "${var.domain}"
  type    = "A"
  records = ["${aws_instance.instance.public_ip}"]
  ttl     = "300"
}

resource "aws_route53_record" "CNAME" {
  zone_id = "${aws_route53_zone.public.id}"
  name    = "www.${var.domain}"
  type    = "CNAME"
  records = ["${var.domain}"]
  ttl     = "300"
}

output "nameservers" {
  value = "${aws_route53_zone.public.name_servers}"
}
