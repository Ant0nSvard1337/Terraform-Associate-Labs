terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

variable "instance_type" {
  type = string
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer"
  }
}