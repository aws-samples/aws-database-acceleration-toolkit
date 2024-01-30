provider "aws" { 
	region = local.region
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key 
} 


locals {
  region = var.region  

  name   = "${var.name}-${var.environment}-${random_id.this.hex}"
  write_endpoint   = "read-write-endpoint-${var.environment}"
  read_endpoint   = "read-only-endpoint-${var.environment}"
  db_username = random_pet.users.id # using random here due to secrets taking at least 7 days before fully deleting from account
  db_password = random_password.password.result

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-rds-proxy"
  }
}

#Existing Data subnet ids
data "aws_subnets" "private" {
  filter {
   name = "vpc-id"
   values = [var.vpc_id]
  }
}

data "aws_subnet" "selected" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}


data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_rds_cluster" "clusterName" {
  cluster_identifier = var.clusterName
}

################################################################################
# RDS Proxy
################################################################################

module "rds_proxy" {
  source  = "terraform-aws-modules/rds-proxy/aws"
  version = "2.1.2"
  create_proxy = true

  name                   = local.name
  iam_role_name          = local.name
  vpc_subnet_ids         = data.aws_subnets.private.ids
  vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]

  db_proxy_endpoints = {
    read_write = {
      name                   = local.write_endpoint
      vpc_subnet_ids         = data.aws_subnets.private.ids
      vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]
      tags                   = local.tags
    },
    read_only = {
      name                   = local.read_endpoint
      vpc_subnet_ids         = data.aws_subnets.private.ids
      vpc_security_group_ids = [module.rds_proxy_sg.security_group_id]
      target_role            = "READ_ONLY"
      tags                   = local.tags
    }
  }

  secrets = {
    (local.db_username) = {
      description = aws_secretsmanager_secret.superuser.description
      arn         = aws_secretsmanager_secret.superuser.arn
      kms_key_id  = aws_secretsmanager_secret.superuser.kms_key_id
    }
  }

  engine_family = "MYSQL"
  debug_logging = true

  # Target Aurora cluster
  target_db_cluster     = true
  db_cluster_identifier = data.aws_rds_cluster.clusterName.cluster_identifier

  tags = local.tags
}

################################################################################
# Supporting Resources
################################################################################

resource "random_pet" "users" {
  length    = 2
  separator = "_"
}

resource "random_password" "password" {
  length  = 16
  special = false
}

module "rds_proxy_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "${local.name}-sg"
  description = "RDS Proxy example security group"
  vpc_id      = data.aws_vpc.selected.id 

  revoke_rules_on_delete = true

  ingress_with_cidr_blocks = [
    {
      description = "Private subnet access"
      rule        = "mysql-tcp"
      cidr_blocks = join(",","${values(data.aws_subnet.selected).*.cidr_block}")
    }
  ]

  egress_with_cidr_blocks = [
    {
      description = "Database subnet access"
      rule        = "mysql-tcp"
      cidr_blocks = join(",","${values(data.aws_subnet.selected).*.cidr_block}")  
    },
  ]

  tags = local.tags
}
################################################################################
# Secrets - DB user passwords
################################################################################

data "aws_kms_alias" "secretsmanager" {
  name = "alias/aws/secretsmanager"
}

resource "aws_secretsmanager_secret" "superuser" {
  name        = local.db_username
  description = "Database superuser, ${local.db_username}, databse connection values"
  kms_key_id  = data.aws_kms_alias.secretsmanager.id

  tags = local.tags
}

resource "aws_secretsmanager_secret_version" "superuser" {
  secret_id = aws_secretsmanager_secret.superuser.id
  secret_string = jsonencode({
    username = local.db_username
    password = local.db_password
  })
}

resource "random_id" "this" {
  keepers = {
    id = var.environment
  }

  byte_length = 4
}

