
# (mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# ARN for Aurora Database for which CloudWatch Dashboard needs to be created 
# For example: "arn:aws:rds:<REGION>:<ACCOUNTID>:db:<DBINSTANCEID>"
database_identifiers ="<DB_INSTANCE_ARN>"

# CloudWatch Dashboard name
name = "aurora-mysql-poc"

# (optional) Environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"
