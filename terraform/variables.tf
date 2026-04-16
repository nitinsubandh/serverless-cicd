variable "region" {
  description = "AWS Region"
  default = "us-east-1"
}

variable "lambda_function_name" {
  description = "Name of lambda function"
  default = "serverless-devops-lambda"
}

variable "lambda_handler" {
  description = "lambda_handler"
  default = "app.handler"
}

variable "lambda_runtime" {
  description = "Runtime for lambda"
  default = "python3.9"
}

