terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.0"
    }
  }

  backend "s3" {
    bucket = "jhonnyulisilva-local-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      owner      = "jhonnyulisilva"
      managed-by = "terraform"
    }
  }
}