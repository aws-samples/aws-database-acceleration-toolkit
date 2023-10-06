# Aurora PostgreSQL Database Cluster Provisioning in an existing VPC

This example deploys the Aurora PosgreSQL Database Cluster in an existing VPC

- Creates a new Aurora PostgreSQL cluster - One writer and one reader database instance

## How to Deploy

### Prerequisites

Ensure that you have installed the following tools in your Mac or Windows Laptop before start working with this module and run Terraform Plan and Apply

1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

### Deployment Steps

#### Step 1: Clone the repo using the command below

```sh
git clone https://github.com/awsdabra/aurora-accelerator-for-terraform
```

#### Step2: Review and update the terraform.tfvars
Create a Terraform variable definition file called terraform.tfvars and update the values for the variables. The following shows an example for the variable to specify AWS region for your database related resources.
```shell script
region = "us-east-2"
```

#### Step3: Run Terraform INIT
Initialize a working directory with configuration files


```shell script
cd examples/aurora-postgres-cluster-existing-vpc
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

