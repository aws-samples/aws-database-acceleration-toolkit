# Primary AWS Region where your resources will be located
# For example: "us-west-2"
region = "<PRIMARY_REGION>"

# Secondary AWS Region where your resources will be located
# For example: "us-east-2"
sec_region = "<SECONDARY_REGION>"

# Primary VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "<PRIMARY_VPC_ID>"

# Secondary VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id_sec = "<SECONDARY_VPC_ID>"

# DB Instance class. 
# Refer AWS documentation for supported DB instance class for DB engine.
# For example: "db.r6g.large"  
instance_class ="<INSTANCE_CLASS>"

# Database Engine for your Aurora mysql Cluster.
engine = "aurora-mysql"

# Database engine mode. Valid value: provisioned
# Refer AWS documentation for supported regions and engine versions for engine mode  
engine_mode = "provisioned"

# Database engine version (optional). If not specified, the default version for the selected engine will be used.
# For example: "8.0.mysql_aurora.3.05.2"  
engine_version = "<ENGINE_VERSION>"

# Global Database cluster name
# For example: "aurora-mysql-poc-globaldb"  
name = "<CLUSTER_NAME>"

# Database environment
# For example: "dev"  
environment = "<ENVIRONMENT>"

# Tagging : Team/Group Name
# For example: "data-engineering"  
groupname = "<GROUPNAME>"

# Tagging : Project or Application Name
# For example: "myapp"  
project = "<PROJECTNAME>"