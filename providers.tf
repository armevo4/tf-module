terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
  }
}


provider "aws" {
  region = "eu-central-1"
  #access_key = ""
  #secret_key = ""
}

