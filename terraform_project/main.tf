terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0468283b4d00417cf"   # Amazon Linux 2 ARM64 AMI
  instance_type = "t4g.micro"               # Free Tier eligible, avoids vCPU quota error

  tags = {
    Name = "Terraform_Demo"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

