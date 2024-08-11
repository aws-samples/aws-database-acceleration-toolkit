#(mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-12345678912345678"
vpc_id = "VPC_ID"

# (mandatory) Instance class. 
# For example: "db.t4g.micro" is a free tier instance 
instance_class ="db.r6g.large"

# (mandatory) Database Engine for your Aurora Cluster. 
engine = "aurora-mysql"

# (mandatory) Number of instances 
instances = {
    one   = {}
    two   = {}
}

# (optional) Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# The database engine version. Updating this argument results in an outage
engine_version = "8.0.mysql_aurora.3.05.2"

# Source DB cluster identifier with atleast one snapshot available
# For example: "aurora-mysql-poc-cluster-dev-447b7895"
db_cluster_identifier = "SOURCE_DB_CLUSTER_IDENTIFIER"

# New Database cluster name
# For example: "aurora-mysql-poc-cluster-from-snp"
name = "NEW_DB_CLUSTER_NAME"

# Database environment
environment = "dev"

# (optional) Tagging : Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"