variable "region" {}
variable "name"   {}
variable "clusterName" {}
variable "vpc_id" {}

variable "aws_access_key" {
  description = "AWS Access key for terraform user"
  default     = ""
} 
variable "aws_secret_key" {
  description = "AWS Security key for terraform user"
  default     = ""
}

variable "environment" {}