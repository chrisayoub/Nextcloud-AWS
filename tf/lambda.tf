variable "zip_file" {
  default = "lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = "${var.zip_file}"
  function_name = "deleteOldSnapshots"
  role          = "${aws_iam_role.lambda.arn}"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.6"
  timeout       = 60
}

resource "aws_cloudwatch_event_target" "delete_snapshots" {
  rule = "${aws_cloudwatch_event_rule.backups.name}"
  arn  = "${aws_lambda_function.lambda.arn}"
}
