terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
     configuration_aliases = [ aws.primary, aws.secondary ]
    }
  }
}