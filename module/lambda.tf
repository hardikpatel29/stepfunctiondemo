data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  handler      = "lambda_function.handler"
  runtime      = "python3.11"
  role         = aws_iam_role.lambda_role.arn

  filename = "lambda.zip"
  source_code_hash = data.archive_file.lambda.output_base64sha256
  //source_code_hash = filebase64sha256("lambda.zip")
}