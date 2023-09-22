# General vars
variable "region" {}
variable "name" {}
variable "environment" {}
variable "groupname" {}
variable "project" {}

variable "enable_dbproxy" {
  description = "Enable dbproxy"
  default     = false
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#IAM
variable "result_kms_key" {
  type        = string
  default     = ""  
  description = "Placeholder for output from previous module"
}
variable "result_secrets_arn" {
  type        = string
  default     = ""    
  description = "Placeholder for output from previous module"
}

# aws_db_proxy
variable "debug_logging" {
  type        = bool
  default     = true
  description = "Whether the proxy includes detailed information about SQL statements in its logs"
}

variable "engine_family" {
  type        = string
  default     = "POSTGRESQL"
  description = "Valid values are MYSQL and POSTGRESQL"
}

variable "idle_client_timeout" {
  type        = number
  default     = 1800
  description = "The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it"
}

variable "require_tls" {
  type        = bool
  default     = true
  description = "Enforce encrypted TLS connections to the proxy"
}

variable "vpc_security_group_ids" {
  type        = set(string)
  description = "One or more VPC security group IDs to associate with the proxy"
}

variable "subnets" {
  type        = set(string)
  description = "One or more VPC subnet IDs to associate with the proxy"
}

variable "auth_scheme" {
  type        = string
  description = "The type of authentication that the proxy uses for connections from the proxy to the underlying database. One of SECRETS."
  default     = "SECRETS"
}

variable "iam_auth" {
  type        = string
  description = "Whether to require or disallow AWS Identity and Access Management (IAM) authentication for connections to the proxy. One of DISABLED, REQUIRED."
  default     = "DISABLED"
}

# aws_db_proxy_default_target_group
variable "connection_borrow_timeout" {
  type        = number
  default     = 120
  description = "The number of seconds for a proxy to wait for a connection to become available in the connection pool. Only applies when the proxy has opened its maximum number of connections and all connections are busy with client sessions"
}

variable "init_query" {
  type        = string
  default     = null
  description = "One or more SQL statements for the proxy to run when opening each new database connection"
}

variable "max_connections_percent" {
  type        = number
  default     = 100
  description = "The maximum size of the connection pool for each target in a target group"
}

variable "max_idle_connections_percent" {
  type        = number
  default     = 50
  description = "Controls how actively the proxy closes idle database connections in the connection pool. A high value enables the proxy to leave a high percentage of idle connections open. A low value causes the proxy to close idle client connections and return the underlying database connections to the connection pool"
}

variable "session_pinning_filters" {
  type        = list(string)
  default     = null
  description = "Each item in the list represents a class of SQL operations that normally cause all later statements in a session using a proxy to be pinned to the same underlying database connection"
}

# aws_db_proxy_target
variable "db_instance_identifier" {
  type        = string
  default     = null
  description = "DB instance identifier. Either `db_instance_identifier` or `db_cluster_identifier` should be specified and both should not be specified together"
}

variable "db_cluster_identifier" {
  type        = string
  default     = null
  description = "DB cluster identifier. Either `db_instance_identifier` or `db_cluster_identifier` should be specified and both should not be specified together"
}
