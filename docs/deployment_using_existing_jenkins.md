# Deployment Steps using New Jenkins Setup

The following steps will walk you through the deployment of toolkit using Jenkins and running pipelines DAT modules. 


### Step 1: Setup Job DSL Plugin in Jenkins

Login to existing Jenkins and validate if "Job DSL" plugin is installed

Go to Manage Jenkins -> Plugins -> Installed Plugins

Search for "Job DSL". If the search shows plugin is installed and enabled, skip to Step 2

To install DSL Plugin go to Manage Jenkins -> Plugins -> Available Plugins

Check "Job DSL" and click install. Make sure plugin is enabled after installation

### Step 2: Setup AWS credentials in Jenkins

Browse Jenkins URL as mentioned in step 5, go to `Manage Jenkins` -> `credentials` -> `system`

Go to "Global Credentials(unrestricted) under system and click add credentials. Enter AWS credentials of your environment, make sure you enter "jenkinsaws" in ID field.

### Step 3: Configure Seed Job

Seed job is used to configure deployment piplelines.

Browse Jenkins url and click "New Item" under Dashboard

Enter an Item name as "Seed Job"

Select "Freestyle Project" -> Click Ok

In Configure page enter below values

Source Code Management: select git and enter "https://github.com/aws-samples/aws-database-acceleration-toolkit" in Repository URL and branch name as "*/main"

![image](../docs/images/jenkins/source_code.png)

In Build section add build steps and select Process Job DSLs

![image](../docs/images/jenkins/job_dsl.png)

Select checkbox "Look on Filesystem" and enter "pipelines/seed_jobdsl.groovy" value in DSL Scripts as shown below and click Save

![image](../docs/images/jenkins/build_step.png.png)

### Step 3: Configure Seed Job

```sh
git clone https://github.com/aws-samples/aws-database-acceleration-toolkit.git
```

### Step 2: Review and update the terraform.tfvars

Navigate to `Jenkins` under `aws-database-acceleration-toolkit/pipelines` folder. 

```shell script
cd aws-database-acceleration-toolkit/pipelines/Jenkins
```
Review the Terraform variable definition file called `terraform.tfvars` and update the values for the variables as per your use case. 

```
# (mandatory) AWS Region where your resources will be located
region = "us-east-2"

# (mandatory) VPC Id where your database and other AWS resources will be located. 
# For example: "vpc-0759280XX50555743"
vpc_id = "vpc-042229eafe1a7f93f"
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

### Step 5: Terraform Apply to create Ec2 instance and setup Jenkins
To create resources by running `terraform apply` commands

```shell script
terraform apply -var-file terraform.tfvars
```

Once terraform apply is completed, console will show EC2 IP address as output. Save this IP address, we need to configure in next steps. 
`Note : It takes 2-3 minutes for Jenkins to be configure after terraform apply is complete` . 

Browse the url using http://[jenkins_ip_output]:8080. Replace [jenkins_ip_output] with EC2 IP address shown in console.

## Part 2 - Configure Jenkins

### Step 6: Setup AWS credentials in Jenkins

Browse Jenkins URL as mentioned in step 5, go to `Manage Jenkins` -> `credentials` -> `system`

Go to "Global Credentials(unrestricted) under system and click add credentials. Enter AWS credentials of your environment, make sure you enter "jenkinsaws" in ID field.

### Step 7: Configure pipelines in Jenkins

Seed job is used to setup example pipelines. Go to Dashboard in Jenkins and schedule a build for Seed Job by clicking green button. Job takes 2-5 seconds to complete and you will see addtional pipelines on the console.  

## Part 3 - Run pipelines to deploy DAT modules

### Step 8: Run pipelines in Jenkins

 The following step will walk you through the deployment of `aurora-postgres-cluster-existing-vpc` example using pipeline. This example expects you to leverage an existing VPC and provision a new Aurora Cluster with one writer and one reader instance. However you can customize the reader and writer instances:

 Click on aurora-postgres-cluster-existing-vpc job on Jenkins console and click "Build with Parameters". Enter the values and click Build.

 It takes 12-15 minutes to setup RDS in your vpc. You can navigate to AWS console and search for RDS. 


### Cleanup: Terraform Destroy - This will destroy Ec2 instance and Jenkins 

To clean up your environment, destroy the AWS resources created 

```sh
terraform destroy -var-file terraform.tfvars
```
