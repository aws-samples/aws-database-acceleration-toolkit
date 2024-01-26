# (mandatory) AWS Region where your resources will be located. Update for your specific usecase
region = "us-west-2"

# (mandatory) VPC Id. For example: "vpc-04d0cfc912221b272"
vpc_id = "vpc-064e0b2cf16eaaa5a"

# (mandatory) Existing aurora clustername. For example : "aurora-pg-poc-cluster-dev-a805da4a"
clusterName = "aurora-mysql-poc-01252024-1-cluster-dev-203c98ba"

# (mandatory) DB proxy name. Customize name as per your use specific usecase
name = "rds-proxy-mysql-01252024-1"

# (optional) Database environment
environment = "dev"