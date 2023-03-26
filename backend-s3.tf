terraform {
  backend "s3" {
    bucket = "terra-state-bucket008"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}