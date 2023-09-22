variable "region" {}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
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


