# AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# VPC Id where your resources will be located 
# For example: "vpc-11112222333344445"
vpc_id = "VPC_ID"

# Database Engine for your Aurora Cluster.
engine = "aurora-postgresql"

# Database engine version (optional). If not specified, the default version for the selected engine will be used.  
engine_version = "15.3"

# Database engine mode. Valid values: provisioned, serverless. 
# Refer AWS documentation for supported regions and engine versions for engine mode 
engine_mode = "provisioned"

# DB Instance class. 
# Refer AWS documentation for supported DB instance class for DB engine
instance_class ="db.r6g.large"

# Specify number of DB instances to be created in the cluster
# Optionally, you can pass the configuration parameters and values (e.g., instance_class="db.r6g.xlarge") for each instance within the curly braces.
# If no parameters are specified, all the DB instances will be created with the same values.
instances = {
    instance1   = {}
    instance2   = {}
}

# Database cluster name
name = "aurora-pg-poc"

# Database environment
environment = "dev"

# Tagging : Team/Group Name
groupname = "dev"

# Tagging : Project or Application Name
project = "dev"

# Skip final snapshot during cluster deletion (optional). If set to 'true' (default), no final snapshot will be taken before deleting the cluster.
skip_final_snapshot= "true"