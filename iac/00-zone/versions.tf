terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.2"
    }
  }
  backend "s3" {
    bucket  = "afarma-iac"
    region  = "us-east-1"
    profile = "default"
    key     = "zone/terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = "default"
}