#(mandatory) Primary AWS Region where your resources will be located
# For example: "us-west-2"
region = "PRIMARY_REGION"

# (mandatory) Secondary AWS Region where your resources will be located
# For example: "us-east-2"
sec_region = "SECONDARY_REGION"

# (mandatory) Primary VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "PRIMARY_VPC_ID"

# (mandatory) Secondary VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id_sec = "SECONDARY_VPC_ID"

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

# (optional) Database cluster name
name = "aurora-pg-poc-globaldb"

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"
