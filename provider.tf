terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "bedrock-state-files"
    key    = "terraform.tfstate"
    region = "eu-west-3"
  }
}

provider "aws" {
  region = "eu-west-3"
}
