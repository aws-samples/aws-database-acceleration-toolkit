


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
 

aws_access_key = var.aws_access_key
aws_secret_key = var.aws_secret_key

    engine_version_pg = var.engine_version
    vpc_id      = local.vpc_id
    vpc_id_sec     = local.vpc_id_sec
    engine      = local.engine
    name		    = local.name
    tags        = local.tags
}
