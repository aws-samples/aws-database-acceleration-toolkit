
#(mandatory) AWS Region where your resources will be located
region = "us-west-2"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
vpc_id = "vpc-064e0b2cf16eaaa5a"

# (mandatory) Instance class. 
# For example: "db.t4g.micro" is a free tier instance 
instance_class ="db.r6g.large"

# (mandatory) Database Engine for your Aurora Cluster. Options: "aurora-postgresql" or "aurora-mysql" 
engine = "aurora-mysql"

# (mandatory) Number of instances 
instances = {
    one   = {}
    two   = {}
}

# (optional) Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# (optional) The database engine version. Updating this argument results in an outage" 
engine_version = "8.0.mysql_aurora.3.02.0"

# (optional) Database cluster name
name = "aurora-mysql-cluster-snp-01252024-1"

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"

# instance identifier for DB Cluster
db_cluster_identifier = "aurora-mysql-poc-01252024-1-cluster-dev-203c98ba"
