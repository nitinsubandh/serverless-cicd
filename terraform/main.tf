resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_function_name}-role"

  assume_role_policy = jsonencode({
    Version =  "2012-10-17",
    Statement = [
      {
        Action =  "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_exec_role.name
}

data "archive_file" "lambda_zip" {
  type = "zip"
  source_dir = "${path.module}/../lambda_function"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "lambda_function" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)
}