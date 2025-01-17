resource "aws_instance" "my_server" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  providers = {
    aws = aws.aws_uswest
  }

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-1a", "us-west-1b", "us-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

