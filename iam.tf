# EBS Create Snapshot
resource "aws_iam_role" "EBS" {
  path = "/service-role/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "EBS_Create_Snapshot" {
  path        = "/service-role/"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "CloudWatchEventsBuiltInTargetExecutionAccess",
      "Effect": "Allow",
      "Action": [
        "ec2:CreateSnapshot"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "EBS" {
  role = "${aws_iam_role.EBS.name}"
  policy_arn = "${aws_iam_policy.EBS_Create_Snapshot.arn}"
}

# EBS Delete Snapshots
resource "aws_iam_policy" "SnapshotFullAccess" {
  path        = "/"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "VisualEditor0",
      "Effect": "Allow",
      "Action": [
        "ec2:DeleteSnapshot",
        "ec2:ModifySnapshotAttribute"
      ],
      "Resource": "arn:aws:ec2:*::snapshot/*"
    },
    {
      "Sid": "VisualEditor1",
      "Effect": "Allow",
      "Action": [
        "ec2:CopySnapshot",
        "ec2:DescribeSnapshotAttribute",
        "ec2:ImportSnapshot",
        "ec2:ResetSnapshotAttribute",
        "ec2:DescribeSnapshots",
        "ec2:DescribeImportSnapshotTasks"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

# Lambda
resource "aws_iam_role" "lambda" {
  path               = "/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "Lambda_Delete_EBS" {
  role = "${aws_iam_role.lambda.name}"
  policy_arn = "${aws_iam_policy.SnapshotFullAccess.arn}"
}
