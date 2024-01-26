variable "region" {}

variable "sec_region" {}

variable "aws_access_key" {
  description = "AWS Access key for terraform user"
  default     = ""
} 
variable "aws_secret_key" {
  description = "AWS Security key for terraform user"
  default     = ""
}


variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = ""
}


variable "vpc_id_sec" {
  description = "ID of the Secondary region VPC where to create security group"
  type        = string
  default     = ""
}

variable "private_subnet_ids_p" {
  description = "Subnet ID to create Subnet ID Group"
  type        = string
  default     = ""
}

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster. Defaults to `aurora`. Valid Values: `aurora`, `aurora-mysql`, `aurora-postgresql`"
  type        = string
  default     = ""
}

variable "engine_mode" {
  description = "The database engine mode. Valid values: `global`, `multimaster`, `parallelquery`, `provisioned`, `serverless`. Defaults to: `provisioned`"
  type        = string
  default     = ""
}

variable "engine_version" {
  description = "The database engine version. Updating this argument results in an outage"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "Instance type to use at master instance. Note: if `autoscaling_enabled` is `true`, this will be the same instance class used on instances created by autoscaling"
  type        = string
  default     = ""
}

variable "instances" {
  description = "Map of cluster instances and any specific/overriding attributes to be created"
  type        = any
  default     = {}
}
variable "name" {}
variable "environment" {}
variable "groupname" {}
variable "project" {}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}


