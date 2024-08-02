#(mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
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

# (optional) Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# (optional) The database engine version. Updating this argument results in an outage" 
engine_version = "15.3"

# Source DB cluster identifier with atleast one snapshot available
# For example: "aurora-mysql-poc-cluster-dev"
db_cluster_identifier = "SOURCE_DB_CLUSTER_IDENTIFIER"

# New Database cluster name
# For example: "aurora-pg-cluster-from-snapshot-0723"
name = "NEW_DB_CLUSTER_NAME

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"