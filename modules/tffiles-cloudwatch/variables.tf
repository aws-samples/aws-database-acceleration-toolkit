variable "region" {}
variable "name" {}
variable "environment" {}
variable "groupname" {}
variable "project" {}

variable "enable_cloudwatch" {
  description = "Enable Cloudwatch"
  default     = false
  type        = bool
}

variable "database_identifiers" {
  type        = list(string)
  description = "List of RDS database identifiers present in dashboard"
}

variable "database_max_connections_warning" {
  type        = number
  description = "Annotation value to show when there is too much simultaneous connections"
  default     = 5000
}
