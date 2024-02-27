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
}

resource "aws_instance" "my_server" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer"
  }
}