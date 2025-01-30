provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "bedrock-state-files-${var.account_id}"
}

resource "aws_lambda_function" "bedrock_lambda" {
  function_name    = "BedrockLambda"
  role            = aws_iam_role.lambda_exec.arn
  handler         = "lambda_function.lambda_handler"
  runtime         = "python3.9"
  filename        = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
}

output "lambda_arn" {
  value = aws_lambda_function.bedrock_lambda.arn
}
