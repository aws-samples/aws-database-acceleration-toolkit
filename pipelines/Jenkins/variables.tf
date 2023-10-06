variable "region" {}

variable "aws_access_key" {
  description = "AWS Access key for terraform user"
  default     = ""
} 
variable "aws_secret_key" {
  description = "AWS Security key for terraform user"
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where to jenkins ec2 instance"
  type        = string
  default     = ""
}