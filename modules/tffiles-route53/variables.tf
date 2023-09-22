variable "domain" {}
variable "region" {}
variable "type" {
  type        = string
  default     = "CNAME"    
}

variable "enable_route53" {
  description = "Enable route53"
  default     = false
  type        = bool
}

variable "private_zone" {
  type        = bool
  default     = true      
}
variable "ttl" {
  type        = string
  default     = "5"   
}
variable "read_endpoint" {}
variable "write_endpoint" {}
variable "internal_write_endpoint" {}
variable "internal_read_endpoint" {}