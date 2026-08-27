terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"   # Replace with your S3 bucket name
    key            = "ec2/terraform.tfstate"       # Path inside the bucket
    region         = "us-east-1"                   # Region of the S3 bucket
    dynamodb_table = "terraform-locks"             # DynamoDB table for state locking
    encrypt        = true                          # Encrypt state at rest
  }
}

