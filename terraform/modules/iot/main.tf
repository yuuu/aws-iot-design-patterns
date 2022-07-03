resource "aws_iot_topic_rule" "rule" {
  name        = "to_dynamodb_v2"
  enabled     = true
  sql         = "SELECT * FROM ${var.topic}"
  sql_version = "2016-03-23"

  dynamodbv2 {
    put_item {
      table_name = var.table_name
    }
    role_arn = aws_iam_role.to_dynamodb.arn
  }
}

resource "aws_iam_role" "to_dynamodb" {
  name = "to_dynamodb-${var.env}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "iot.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "to_dynamodb" {
  name = "to_dynamodb"
  role = aws_iam_role.to_dynamodb.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "dynamodb:PutItem"
        ],
        "Resource": "${var.table_arn}"
    }
  ]
}
EOF
}