terraform {
  backend "s3" {
    bucket         = "splunk-leila"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-table-splunk"
  }
}