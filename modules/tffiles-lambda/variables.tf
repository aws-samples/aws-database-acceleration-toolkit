variable "region" {}
variable "name" {}
variable "environment" {}
variable "groupname" {}
variable "project" {}
variable "s3_bucket" {}
variable "s3_key" {}
variable "iam_role" {}

variable "enable_lambda" {
  description = "Enable lambda"
  default     = false
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {}
variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
}
variable "security_group_ids" {
  description = "List of VPC security groups to associate to the cluster in addition to the SG we create in this module"
  type        = list(string)
  default     = []
}

variable "secret_name" {}

#lambda
variable "runtime" {
  description = "The runtime of the lambda to create"
  default     = "python3.9"
}

variable "handler" {
  description = "The handler name of the lambda (a function defined in your lambda)"
  default     = "lambda_function.lambda_handler"
}

variable "timeout" {
  description = "Lambda timeout value"
  type        = number
  default     = 100
}