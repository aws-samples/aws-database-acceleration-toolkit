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
# AWS Region where your resources will be located.
# For example: "us-west-2"
region = "<REGION>"

# VPC Id where your resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "<VPC_ID>"

# Database Engine for your Aurora mysql Cluster.
engine = "aurora-postgresql"

# Database engine version (optional). If not specified, the default version for the selected engine will be used.
# For example: "15.3"  
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

# Database cluster name
# For example: "aurora-pg-poc"  
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

# Skip final snapshot during cluster deletion (optional). If set to 'true' (default), no final snapshot will be taken before deleting the cluster.
skip_final_snapshot= "true"

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
