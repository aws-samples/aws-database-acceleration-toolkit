Welcome to Database Acceleration Toolkit(DAT) !

The **Database Acceleration Toolkit(DAT)** is an open-source Infrastructure-as-a-code based (Terraform) single click solution to simplify and automate initial setup, provisioning (day 1) and on-going maintenance (day 2 operations) for [Amazon Aurora](https://aws.amazon.com/rds/aurora/) database on AWS Cloud. 

It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases such as SQL Server to Amazon Aurora and operating these databases in production.

**Key Features**

Key features of DAT include automation of initial aurora setup and provisioning and on-going maintenance activities:

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

**Architecture** 

Below is the high level architectre of Database Acceleration Toolkit. 
![image](images/DAT-Architecture.png)


