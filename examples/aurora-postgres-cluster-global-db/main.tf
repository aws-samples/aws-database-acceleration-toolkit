provider "aws" { 
  alias  = "primary"
	region = local.region
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key 
} 


provider "aws" {
  alias  = "secondary"
  region = var.sec_region
  access_key = var.aws_access_key 
  secret_key = var.aws_secret_key 
}


data "aws_subnets" "primary" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  provider = aws.primary
}

data "aws_subnets" "secondary" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id_sec]
  }
  provider = aws.secondary
}

locals {
  region         = var.region
  sec_region     = var.sec_region
  vpc_id         = var.vpc_id
  vpc_id_sec     = var.vpc_id_sec
  name           = var.name
  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode
  instances      = var.instances
  instance_class = var.instance_class
  environment    = var.environment
  groupname      = var.groupname
  project        = var.project
  tags        = {
                  Name = local.name
                  GroupName = local.groupname
                  Environment = local.environment
                  Project = local.project
                }
}

# deploy aurora database cluster
module "aurora_poc" {
    source = "../../modules/tffiles-aurora-global"
    instance_class  = local.instance_class 
    region	    = local.region
    sec_region  = local.sec_region
    //vpc_id      = local.vpc_id
    //vpc_id_sec     = local.vpc_id
    //private_subnet_ids_p = local.private_subnet_ids_p
    private_subnet_ids_p     = tolist(data.aws_subnets.primary.ids)
    private_subnet_ids_s   = tolist(data.aws_subnets.secondary.ids)
    engine      = local.engine
    //engine_mode = local.engine_mode
    //instances   = local.instances
    //engine_version  = local.engine_version 
    name		    = local.name
    //environment	= local.environment
    //groupname	  = local.groupname
    //project	    = local.project
    tags        = local.tags
}
