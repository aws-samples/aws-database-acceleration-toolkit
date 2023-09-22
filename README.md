# Database Acceleration Toolkit (DAT) 

'Database Acceleration Toolkit' is a collection of Terraform modules which simplify and automate initial setup and provisioning (day 1) and on-going maintainance (day 2 operations) for [Amazon Aurora](https://aws.amazon.com/rds/aurora/) database on AWS Cloud. It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases such as SQL Server to Amazon Aurora and operating these databases in production.

## Note: 
We are in alpha state currently and updates may introduce breaking changes. Solution is not recommended for production use at this time.

## FAQ

Q: Who is the intended audience for DAT? 

A: The intended audience for DAT are AWS customers who are migrating from commercial databases such as SQL Server to Amazon Aurora.


Q: What are some of the key features of DAT? 

A: Some of the key features of DAT include automation of common tasks:
   1. Provisioning of new Aurora cluster
   2. Provisioning of new [Aurora Global Database](https://aws.amazon.com/rds/aurora/global-database/)
   3. Monitoring Aurora database 
   	a. [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
   	b. [Amazon Managed Grafana](https://aws.amazon.com/grafana/)
	c. Curated CloudWatch and Grafana Dashboards
	d. Curated Performance Insights Dashboard for both Amazon CloudWatch and Amazon Managed Grafana
   4. Provisioning and Integration with [RDS Proxy](https://aws.amazon.com/rds/proxy/) to reuse database connections and improved reliability
   5. Provisioning of [AWS Data Migration Services (DMS)](https://aws.amazon.com/dms/) Instances to migrate data to Aurora
   6. Restore cluster from S3


Q: Is there any cost associated with using DAT? 

A: No, DAT is an open-source solution and is completely free to use. However, you will be responsible for any AWS costs associated with running your Aurora clusters and other AWS services.


Q: Is there a community or support  for DAT? 

A: DAT is supported by Solution Architects of AWS on best effort basis. However, users are encourged to ask questions, open issues, contribute and provide feedback on DAT.

Q. What DB Engines are currently supported?

A: Currently, we support PostgreSQL only. MySQL database engine is on the short-term (3-6 months) roadmap. 

# Getting Started

Below sample example demonstrate how you can leverage DAT to provision new cluster.

## Prerequisites

First, ensure that you have installed the following tools locally.

1. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. [kubectl](https://kubernetes.io/docs/tasks/tools/)
3. [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Deployment Steps

The following steps will walk you through the deployment of an example blueprint. This example expect you to leverage an existing VPC and provision a new Aurora Cluster with one writer and one reader instance. You can customize it however:

### Step 1: Clone the repo using the command below

```sh
git clone https://github.com/awsdabra/aurora-accelerator-for-terraform
```

### Step 2: Review and update the terraform.tfvars
Review the Terraform variable definition file called terraform.tfvars and update the values for the variables as per your use case. The following shows an example for the variable to specify AWS region for your database related resources.
```shell script
region = "us-east-2"
```

### Step 3: Run Terraform INIT
Initialize a working directory with configuration files


```shell script
cd examples/aurora-postgres-cluster-existing-vpc
terraform init
```

### Step 4: Run Terraform PLAN
Verify the resources created by this execution

```shell script
terraform plan -var-file terraform.tfvars
```

### Step 5: Terraform APPLY
To create resources

```shell script
terraform apply -var-file terraform.tfvars
```

### Cleanup

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```

## Next Steps

TBD

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.
