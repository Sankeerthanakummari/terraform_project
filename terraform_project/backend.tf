terraform {
  backend "s3" {
    bucket         = "sankeerthana-cli-bucket"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"   # or your bucket’s region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

