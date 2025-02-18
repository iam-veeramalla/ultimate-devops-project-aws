# Configure the AWS Provider
provider "aws" {
  region  = "us-west-2"
}


resource  "aws_s3_bucket" "example" {
  bucket = "demo-terraform-eks-state-sai-bucket"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-eks-state-sai-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LOCKID"
 
  attribute {
    name = "UserId"
    type = "S"
  }
}


