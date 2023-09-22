# RDS Proxy - IAM Authentication & PostgreSQL Cluster

Configuration in this directory creates:

- AWS RDS Proxy w/ IAM authentication enabled for an existing RDS Aurora PostgreSQL cluster

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
Create a Terraform variable definition file called terraform.tfvars and update the values for the variables. The following shows an example for the variable to specify AWS region for your database related resources and a few other mandatory resources.  

```shell script
region = "us-east-2"
name = "rds-proxy-ex-postgres"
vpc_id = "vpc-04d0cfc912221b272""
clusterName = "aurora-pg-poc-cluster-dev-a805da4a"

```

#### Step3: Run Terraform INIT
Initialize a working directory with configuration files


```shell script
cd examples/db-proxy-to-existing-postgres-cluster
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

### Step6: (Optional) Capture the outputs for resources
Copy all of the resources created to an internal document 




## Validation

An EC2 instance configuration has been provided for use in validating the example configuration. After provisioning the configuration, there are some outputs that have been provided to aid in validating changes. To perform validation, after the EC2 instance finishes provisioning:

1. Connect to the EC2 instance using Session Manager
2. Copy the output from `superuser_proxy_iam_token` and paste it into the Session Manager window - this generates the token for connecting to the proxy with IAM auth.
3. Copy the output from `superuser_proxy_iam_connect` and paste it into the window - NOTE: remove the string escape slashes 
```sh
`psql \"host...` -> `psql "host...`
```
6. You should now be connected to the `example` database in the RDS instance via the AWS Proxy using IAM authentication

## Cleanup

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```


