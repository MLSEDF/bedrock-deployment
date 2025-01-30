resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "Policy pour permettre à Lambda d'utiliser Bedrock"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = "bedrock:InvokeModel"
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "logs:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_lambda_function" "bedrock_lambda" {
  function_name = "invoke-bedrock"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.8"
  handler       = "lambda_function.lambda_handler"

  filename         = "lambda.zip"

  environment {
    variables = {
      BEDROCK_MODEL = "amazon.titan-text-lite-v1"
    }
  }
}

output "lambda_function_name" {
  value = aws_lambda_function.bedrock_lambda.function_name
}
