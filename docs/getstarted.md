This section demonstrate how you can leverage DAT to provision new cluster.

## Prerequisites

First, ensure that you have installed the following tools locally.

1. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [kubectl](https://kubernetes.io/docs/tasks/tools/)
3. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
   
## Deployment Steps

The following steps will walk you through the deployment of `aurora-postgres-cluster-existing-vpc` example blueprint. This example expects you to leverage an existing VPC and provision a new Aurora Cluster with one writer and one reader instance. However you can customize the reader and writer instances:

**Step 1: Clone the repo using the command below**

```sh
git clone https://github.com/aws-samples/aws-database-acceleration-toolkit.git
```

**Step 2: Review and update the terraform.tfvars**

Navigate to `aurora-postgres-cluster-existing-vpc` under `aws-database-acceleration-toolkit/examples` folder. 

```sh
cd aws-database-acceleration-toolkit/examples/aurora-postgres-cluster-existing-vpc
```
Review the Terraform variable definition file called `terraform.tfvars` and update the values for the variables as per your use case. 

```
# (mandatory) AWS Region where your resources will be located
region = "<AWS_REGION>"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
vpc_id = "<VPC_ID>"

# (mandatory) Instance class. 
# For example: "db.t4g.micro" is a free tier instance 
instance_class ="<DB_INSTANCE_CLASS>"

# (mandatory) Database Engine for your Aurora Cluster. Options: "aurora-postgresql" or "aurora-mysql" 
# For example: "aurora-postgresql"
engine = "<DB_ENGINE>"

# (mandatory) Number of instances 
instances = {
    one   = {}
    two   = {}
}

# (optional) Default is "provisioned" database cluster; For serverless, select "serverless"
engine_mode = "<DB_ENGINE_MODE>"

# (optional) The database engine version. Note -Updating this argument results in an outage" 
# For example: "15.3"
engine_version = "<DB_ENGINE_VERSION>"

# (optional) Database cluster name, for example 'aurora-pg-poc'
# For example: "aurora-pg-poc"
name = "<DB_CLUSTER_NAME>"

# (optional) Database environment
# For example: "dev"
environment = "<ENVIRONMENT>"

# (optional) Tagging : Team/Group Name
# For example: "dev"
groupname = "<TEAM_GROUP_NAME>"

# (optional) Tagging : Project or Application Name
# For example: "dev"
project = "<PROJECT_NAME>"

```
The example below illustrates how to use the 'region' variable to define the AWS region for your database-related resources.
```sh
region = "us-east-2"
```

**Step 3: Run Terraform INIT**

Initialize a working directory with configuration files by running `terraform init` 

```sh
terraform init
```

**Step 4: Run Terraform PLAN**

Verify the resources created by this execution using `terraform plan`

```sh
terraform plan -var-file terraform.tfvars
```

**Step 5: Terraform APPLY**

To create resources by running `terraform apply` commands

```sh
terraform apply -var-file terraform.tfvars
```

**Cleanup: Terraform DESTROY**

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```
