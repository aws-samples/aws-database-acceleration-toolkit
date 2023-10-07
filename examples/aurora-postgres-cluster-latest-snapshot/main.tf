provider "aws" { 
	region = local.region
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key 
} 


data "aws_subnets" "primary" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

locals {
  region         = var.region
  vpc_id         = var.vpc_id
  name           = var.name
  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode
  instances      = var.instances
  instance_class = var.instance_class
  environment    = var.environment
  groupname      = var.groupname
  project        = var.project
  db_cluster_identifier = var.db_cluster_identifier
  tags        = {
                  Name = local.name
                  GroupName = local.groupname
                  Environment = local.environment
                  Project = local.project
                }
}

data "aws_db_cluster_snapshot" "snapshot" {
    most_recent = true
    db_cluster_identifier = local.db_cluster_identifier
}

# deploy aurora database cluster
module "aurora_poc" {
    source = "../../modules/tffiles-rds"
    instance_class  = local.instance_class 
    region	    = local.region
    vpc_id      = local.vpc_id
    subnets     = tolist(data.aws_subnets.primary.ids)
    engine      = local.engine
    engine_mode = local.engine_mode
    instances   = local.instances
    engine_version  = local.engine_version 
    name		    = local.name
    environment	= local.environment
    groupname	  = local.groupname
    project	    = local.project
    tags        = local.tags
    snapshot_identifier = "${data.aws_db_cluster_snapshot.snapshot.id}"
}
