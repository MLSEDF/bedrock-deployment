resource "aws_bedrock_model" "ai_model" {
  name                  = "my-bedrock-model"
  foundation_model_name = "amazon.titan-text-lite-v1"
  execution_role_arn    = aws_iam_role.bedrock_role.arn
}

output "model_id" {
  value = aws_bedrock_model.ai_model.id
}
