terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
  alias = "aws_useast"
}

provider "aws" {
    profile = "default"
    region = "us-west-1"
    alias = "aws_uswest"
  
}
