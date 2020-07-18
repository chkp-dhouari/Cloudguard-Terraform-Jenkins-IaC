terraform {
  backend "s3" {
    bucket         = "deanterra"
    key            = "remote1.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
