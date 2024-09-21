# AWS Region where your resources will be located.
# For example: "us-west-2"
region = "<REGION>"

# VPC Id where your resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "<VPC_ID>"

# Database Engine for your Aurora mysql Cluster.
engine = "aurora-mysql"

# Database engine version (optional). If not specified, the default version for the selected engine will be used.
# For example: "8.0.mysql_aurora.3.05.2"  
engine_version = "<ENGINE_VERSION>"

# Database engine mode. Valid value: provisioned
# Refer AWS documentation for supported regions and engine versions for engine mode  
engine_mode = "provisioned"

# DB Instance class. 
# Refer AWS documentation for supported DB instance class for DB engine.
# For example: "db.r6g.large"  
instance_class ="<INSTANCE_CLASS>"

# Specify number of DB instances to be created in the cluster.
# Optionally, you can pass the configuration parameters and values (for e.g., instance_class="db.r6g.xlarge") for each instance within the curly braces.
# If no parameters are specified, all the DB instances will be created with the same values.
instances = {
    instance1   = {}
    instance2   = {}
}

# Source DB cluster identifier with atleast one snapshot available
# For example: "aurora-mysql-poc-cluster-dev-447b7895"
db_cluster_identifier = "<SOURCE_DB_CLUSTER_IDENTIFIER>"

# New Database cluster name
# For example: "aurora-mysql-poc-cluster-from-snp"
name = "<NEW_DB_CLUSTER_NAME>"

# Database environment
# For example: "dev"  
environment = "<ENVIRONMENT>"

# Tagging : Team/Group Name
# For example: "data-engineering"  
groupname = "<GROUPNAME>"

# Tagging : Project or Application Name
# For example: "myapp"  
project = "<PROJECTNAME>"
