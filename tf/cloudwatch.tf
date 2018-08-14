variable "backup_frequency" {
  default = "14"
}

data "aws_ebs_volume" "ebs_volume" {
  filter {
    name   = "attachment.instance-id"
    values = ["${aws_instance.instance.id}"]
  }

  depends_on = ["aws_instance.instance"]
}

data "aws_caller_identity" "current" {}

resource "aws_cloudwatch_event_rule" "backups" {
  schedule_expression = "rate(${var.backup_frequency} days)"
}

resource "aws_cloudwatch_event_target" "create_snapshot" {
  rule     = "${aws_cloudwatch_event_rule.backups.name}"
  arn      = "arn:aws:events:${var.region}:${data.aws_caller_identity.current.account_id}:target/create-snapshot"
  input    = "${jsonencode("${data.aws_ebs_volume.ebs_volume.volume_id}")}"
  role_arn = "${aws_iam_role.EBS.arn}"
}
