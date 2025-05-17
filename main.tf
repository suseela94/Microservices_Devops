terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
          }
                     }
          }

provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc-microservice"
  cidr = "10.0.0.0/19"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.16.0/26", "10.0.18.0/28"]
  public_subnets  = ["10.0.4.0/23", "10.0.3.0/25"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

resource "aws_vpc_security_group_vpc_association" "eks-cluster-node-sg" {
  security_group_id = "sg-029331d7aa9fe13cf"
  vpc_id            = "vpc-0479877b858ac22fd"
}
