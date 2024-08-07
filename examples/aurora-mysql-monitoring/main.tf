provider "aws" { 
	region = local.region
    access_key = var.aws_access_key 
    secret_key = var.aws_secret_key 
} 

locals {
  region         = var.region
  name           = var.name
  environment    = var.environment
  groupname      = var.groupname
  project        = var.project
  database_identifiers = [var.database_identifiers]
  tags           = {
                  Name = local.name
                  GroupName = local.groupname
                  Environment = local.environment
                  Project = local.project
                }
}

# deploy aurora database cluster
module "aurora_monitoring" {
    source = "../../modules/tffiles-cloudwatch"
    region	    = local.region
    name		    = local.name
    environment	= local.environment
    groupname	  = local.groupname
    project	    = local.project
    database_identifiers = local.database_identifiers
    //tags        = local.tags
}
