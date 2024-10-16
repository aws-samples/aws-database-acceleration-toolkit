# Aurora MySQL Database Global Cluster Provisioning in an existing VPC

This example deploys the Aurora MySQL Database Global Cluster in an existing VPC

- Creates a new Aurora MySQL cluster in two regions

## How to Deploy

### Prerequisites

Ensure that you have installed the following tools in your Mac or Windows Laptop before start working with this module and run Terraform Plan and Apply

1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Deployment Steps

#### Step 1: Clone the repo using the command below

```sh
git clone https://github.com/aws-samples/aws-database-acceleration-toolkit
```

#### Step2: Review and update the terraform.tfvars
Update the values in tfvars file for the variables. The following shows an example for the variable to specify AWS region for your database related resources.
```shell script
# AWS Region where your resources will be located
region = "Primary Region"

# AWS Secondary Region where your resources will be located
sec_region = "Secondary Region"

# VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "Primary Region VPC ID"

# VPC Id for secondary region where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id_sec = "Secondary Region VPC ID"
```

#### Step3: Run Terraform INIT
Initialize a working directory with configuration files


```shell script
cd examples/aurora-mysql-cluster-global-db
terraform init
```

#### Step4: Run Terraform PLAN
Verify the resources created by this execution

```shell script
terraform plan -var-file terraform.tfvars
```

#### Step5: Terraform APPLY
To create resources

```shell script
terraform apply -var-file terraform.tfvars
```

## Cleanup

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```

