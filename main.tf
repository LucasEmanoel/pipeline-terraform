terraform {

  required_version = ">= 1.3.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

}


provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "lucasemanoel"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "lucasemanoel-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}