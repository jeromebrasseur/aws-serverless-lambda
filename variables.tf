variable "AWS_REGION" {
  type = string
  description = "AWS region"
  default = "eu-west-3"
}

variable "LAMBDA_FUNCTION_NAME" {
  type = string
  description = "Lambda Function Name"
  default = "helloworld-lambda"
}
