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
  ami           = "ami-0f8ca728008ff5af4"   # Amazon Linux 2 x86_64 AMI for ap-south-1
  instance_type = "t3.micro"                # Free Tier eligible, x86 bucket (no ARM quota issue)

  tags = {
    Name = "Terraform_Demo"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_id" {
  value = aws_instance.app_server.id
}

