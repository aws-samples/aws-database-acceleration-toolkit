#(mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "VPC_ID"

# (mandatory) Existing Aurora DB Cluster Name. 
# For example : "aurora-mysql-poc-cluster-dev"
clusterName = "EXISTING_DB_CLUSTER_NAME"

# (mandatory) DB Proxy Name. Customize name as per your use specific usecase
# For example : "rds-proxy-mysql-poc"
name = "DB_PROXY_NAME"

# (optional) Database environment
environment = "dev"