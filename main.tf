provider "aws" {
  region = var.AWS_REGION
}

resource "aws_iam_role" "lambda_role" {
  name = "Lambda_Function_Role"
  assume_role_policy = jsonencode(
  {
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  }
  )
}

data "archive_file" "lambda_hello_world" {
  type = "zip"

  source_dir = "${path.module}/app"
  output_path = "${path.module}/app.zip"
}

resource "aws_lambda_function" "helloworld_lambda_function" {
  function_name = var.LAMBDA_FUNCTION_NAME
  handler = "hello.handler"
  runtime = "nodejs22.x"
  role = aws_iam_role.lambda_role.arn
  filename = "${data.archive_file.lambda_hello_world.output_path}"
  tags = {
    Name = var.LAMBDA_FUNCTION_NAME
    Env = "DEV"
  }
}
