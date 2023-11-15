
#(mandatory) AWS Region where your resources will be located
region = "us-east-2"

# (mandatory) AWS Secondary Region where your resources will be located
sec_region = "us-west-2"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
vpc_id = "vpc-0f75d242b90b7a019"

# (mandatory) VPC Id for secondary region where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
vpc_id_sec = "vpc-0e2bda05fcf38000f"

# (mandatory) Instance class. 
# For example: "db.t4g.micro" is a free tier instance 
instance_class ="db.r6g.large"

# (mandatory) Database Engine for your Aurora Cluster. Options: "aurora-postgresql" or "aurora-mysql" 
engine = "aurora-postgresql"

# (mandatory) Number of instances 
instances = {
    one   = {}
    two   = {}
}

# (optional) Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# (optional) The database engine version. Updating this argument results in an outage" 
engine_version = "15.3"

# (optional) Database cluster name
name = "aurora-pg-poc"

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"
