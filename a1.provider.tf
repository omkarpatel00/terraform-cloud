###terraform setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.0"
      #in production always put this version number
    }
    ###adding backend as s3 for remote state storage
    random = {
      source = "hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }
    backend "remote" {
      hostname="app.terraform.io"
      organization = "terraform-cloud" 
      workspace {
        name = "vpc-migration"
      }
    }

  }
  ####

}
#provider block
provider "aws" {
  region = var.aws_region
}