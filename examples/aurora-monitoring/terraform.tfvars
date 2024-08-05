
# (mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "us-west-2"

# ARN for Aurora Database for which CloudWatch Dashboard needs to be created 
# For example: "arn:aws:rds:<REGION>:<ACCOUNTID>:db:<DBINSTANCEID>"
database_identifiers ="arn:aws:rds:us-west-2:193438301004:db:aurora-mysql-cluster-snp-0802-1-dev-7962d49f-one"

# CloudWatch Dashboard name
name = "aurora-pg-poc-dashboard"

# (optional) Environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"
