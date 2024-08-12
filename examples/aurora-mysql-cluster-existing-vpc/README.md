# Aurora MySQL Database Cluster Provisioning in an existing VPC

This example deploys the Aurora MySQL Database Cluster in an existing VPC

- Creates a new Aurora MySQL cluster - One writer and one reader database instance

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

Note: if you do not have existing VPC, please create one using VPC [this](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_VPC.html) documentation 

```shell script
#(mandatory) AWS Region where your resources will be located
region = "Primary Region"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-11112222333344445"
vpc_id = "VPC ID"
```

#### Step3: Run Terraform INIT
Initialize a working directory with configuration files


```shell script
cd examples/aurora-mysql-cluster-existing-vpc
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

