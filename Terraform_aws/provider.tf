terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAXHTV2U2WC7C4JNGY"
  secret_key = "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"
}