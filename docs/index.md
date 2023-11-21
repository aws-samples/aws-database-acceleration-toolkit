Welcome to Database Acceleration Toolkit(DAT) !

The **Database Acceleration Toolkit(DAT)** is an open-source Infrastructure-as-a-code based (Terraform) single click solution to simplify and automate initial setup, provisioning (day 1) and on-going maintenance (day 2 operations) for [Amazon Aurora](https://aws.amazon.com/rds/aurora/) database on AWS Cloud. 

It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases such as SQL Server to Amazon Aurora and operating these databases in production.

**Key Features**

Key features of DAT include automation of initial aurora setup and provisioning and on-going maintenance activities:

   1. Provisioning of new Amazon Aurora database cluster
   2. Provisioning and Integration with RDS Proxy to reuse database connections and improved reliability
   3. Provisioning of new Aurora Global Database
   4. Monitoring Aurora database
      - Amazon CloudWatch
      - Curated CloudWatch Dashboards for database monitoring
   6. Restore cluster from S3

**Architecture** 

Below is the high level architectre of Database Acceleration Toolkit. 
![image](images/DAT-Architecture.png)


