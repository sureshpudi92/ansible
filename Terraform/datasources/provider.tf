terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # you can give access key and secret key but security problem
  region = "ap-south-1"
}