variable "aws_region" {
  description = "La région AWS où déployer les ressources"
  type        = string
  default     = "eu-west-3"
}

variable "lambda_function_name" {
  description = "Nom de la fonction Lambda"
  type        = string
  default     = "bedrock_lambda"
}

variable "lambda_runtime" {
  description = "Runtime de la fonction Lambda"
  type        = string
  default     = "python3.9"
}
