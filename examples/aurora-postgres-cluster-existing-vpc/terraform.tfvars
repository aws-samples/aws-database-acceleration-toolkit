#(mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "VPC_ID"

# (mandatory) Instance class. 
# For example: "db.t4g.micro" is a free tier instance 
instance_class ="db.r6g.large"

# (mandatory) Database Engine for your Aurora Cluster.
engine = "aurora-postgresql"

# (mandatory) Number of instances 
instances = {
    one   = {}
    two   = {}
}

# Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# The database engine version. Updating this argument results in an outage" 
engine_version = "15.3"

# Database cluster name
name = "aurora-pg-poc"

# (optional) Skip final snapshot during cluster deletion. Default is "true"
skip_final_snapshot= "true"

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"