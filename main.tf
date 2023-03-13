terraform {

  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      version = "4.12.1"
      source  = "hashicorp/aws"
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
    bucket = "remote-state-lucasemanoel-2"
    key    = "aws-pipeline/terraform.tfstate"
    region = "us-east-1"
  }
}