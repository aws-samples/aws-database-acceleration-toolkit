terraform {
  required_version = ">= 1.0.0"
  backend "local" {
    path = "terraform_${statefile}.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
     
    }
  }
}
