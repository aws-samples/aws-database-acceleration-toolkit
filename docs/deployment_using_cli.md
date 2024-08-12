# Deployment Steps using CLI

The following steps will walk you through the deployment of `aurora-postgres-cluster-existing-vpc` example blueprint. This example expects you to leverage an existing VPC and provision a new Aurora Cluster with one writer and one reader instance. However you can customize the reader and writer instances:

### Step 1: Clone the repo using the command below

```sh
git clone https://github.com/aws-samples/aws-database-acceleration-toolkit.git
```

### Step 2: Review and update the terraform.tfvars
Navigate to `aurora-postgres-cluster-existing-vpc` under `aws-database-acceleration-toolkit/examples` folder. 

```shell script
cd aws-database-acceleration-toolkit/examples/aurora-postgres-cluster-existing-vpc
```
Review the Terraform variable definition file called `terraform.tfvars` and update the values for the variables as per your use case. 

```
#(mandatory) AWS Region where your resources will be located
# For example: "us-west-2"
region = "REGION"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
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

# Default is provisioned database cluster; For serverless, select "serverless"
engine_mode = "provisioned"

# The database engine version. Updating this argument results in an outage" 
engine_version = "15.3"

# Database cluster name
name = "aurora-pg-poc"

# (optional) Skip final snapshot during cluster deletion. Default is "true"
skip_final_snapshot= "true"

# (optional) Database environment
environment = "dev"

# (optional) Tagging : Team/Group Name
groupname = "dev"

# (optional) Tagging : Project or Application Name
project = "dev"

```
The example below illustrates how to use the 'region' variable to define the AWS region for your database-related resources.
```shell script
region = "us-east-2"
```

### Step 3: Run Terraform Init
Initialize a working directory with configuration files by running `terraform init` 

```shell script
terraform init
```

### Step 4: Run Terraform Plan
Verify the resources created by this execution using `terraform plan`

```shell script
terraform plan -var-file terraform.tfvars
```

### Step 5: Terraform Apply
To create resources by running `terraform apply` commands

```shell script
terraform apply -var-file terraform.tfvars
```

### Cleanup: Terraform Destroy

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```
