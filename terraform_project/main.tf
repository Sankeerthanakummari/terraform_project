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
  region = "us-east-1"   # Change region here (e.g., us-east-1, ap-southeast-1)
}

resource "aws_instance" "app_server" {
  ami           = "ami-0c02fb55956c7d316"   # Amazon Linux 2 x86_64 AMI for us-east-1
  instance_type = "t3.micro"                # Free Tier eligible, x86 bucket

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

