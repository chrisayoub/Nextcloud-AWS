variable "backup_frequency" {
  default = "14"
}

data "aws_ebs_volume" "ebs_volume" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}"]
  }

  depends_on = ["aws_instance.instance"]
}

resource "aws_cloudwatch_event_rule" "backups" {
  schedule_expression = "rate(${var.backup_frequency} days)"
}

resource "aws_cloudwatch_event_target" "create_snapshot" {
  rule = "${aws_cloudwatch_event_rule.backups.name}"
  arn = "arn:aws:events:${var.region}:${var.account_id}:target/create-snapshot"
  input = "${jsonencode("${data.aws_ebs_volume.ebs_volume.volume_id}")}"
  role_arn = "${aws_iam_role.EBS.arn}"
}