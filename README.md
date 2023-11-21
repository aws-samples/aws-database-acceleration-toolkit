# AWS Database Acceleration Toolkit (DAT) 
Welcome to the **AWS Database Acceleration Toolkit (DAT)** !!! 

The **AWS Database Acceleration Toolkit(DAT)** is an open-source Infrastructure-as-a-code based (Terraform) single click solution to simplify and automate initial setup, provisioning (day 1) and on-going maintenance (day 2 operations) for [Amazon Aurora](https://aws.amazon.com/rds/aurora/) database on AWS Cloud. 

It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases such as MS SQL Server to Amazon Aurora database and operating these databases in production.

## Architecture

![image](docs/images/DAT-Architecture.png)

## Documentation

To explore the complete project documentation, please visit our [documentation](https://aws-samples.github.io/aws-database-acceleration-toolkit/) site.

## Intended audience

The intended audiences for DAT are AWS customers who are migrating from commercial databases such as MS SQL Server to Amazon Aurora.

## Key Features

Key features of DAT include automation of initial Amazon Aurora setup, provisioning and on-going maintenance activities,
1. Provisioning of new Amazon Aurora database cluster
2. Provisioning and Integration with [RDS Proxy](https://aws.amazon.com/rds/proxy/) to reuse database connections and improved reliability
3. Provisioning of new [Aurora Global Database](https://aws.amazon.com/rds/aurora/global-database/)
4. Monitoring Aurora database 
	1. [Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)
	2. Curated CloudWatch Dashboards for database monitoring
5. Restore cluster from S3

## Blueprint Examples

DAT comprises of below examples. Click each link to get more details on running these examples.
1. [aurora-postgres-cluster-existing-vpc](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-existing-vpc) - Creates new Aurora Postgres Cluster.
2. [db-proxy-to-existing-postgres-cluster](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/db-proxy-to-existing-postgres-cluster) - Creates proxy to existing Aurora Postgres.
3. [aurora-postgres-cluster-global-db](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-global-db) - Creates new Aurora Postgres Clusters in Primary and Secondary region.
4. [aurora-monitoring](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-monitoring) - Setup monitoring dashboard for aurora.
5. [aurora-postgres-cluster-latest-snapshot](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-latest-snapshot) - Deploys the Aurora PostgreSQL Database Cluster from the latest cluster snapshot

## Getting Started

This section demonstrate how you can leverage DAT to provision new database cluster.

## Prerequisites

First, ensure that you have installed the following tools locally.

1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
3. [kubectl](https://kubernetes.io/docs/tasks/tools/)
4. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## DAT Deployment

1. [Deployment Steps using new Jenkins](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_new_jenkins.md)
2. [Deployment Steps using existing Jenkins](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_existing_jenkins.md)
3. [Deployment Steps using CLI](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_cli.md)


## Associated Cost

DAT is an open-source solution and is completely free to use. However, you will be responsible for any AWS costs associated with running your Aurora clusters and other AWS services.

## Support 

DAT is supported by Solution Architects of AWS on best effort basis. However, users are encouraged to ask questions, open issues, contribute and provide feedback on DAT.

## Next Steps

Currently, DAT supports PostgreSQL only. MySQL database engine is on the short-term roadmap. 

## Contributing

The core team for AWS Database Acceleration Toolkit (DAT) include the following, in alphabetical order:

KK (Krishna) Venkateswaran
Mitesh Purohit
Munish Dabra
Mythili Annamalai Sekar
Piyush Mattoo
Prithvi Reddy
Ravi Mathur

However, we welcome the wider open-source community to this project. See [CONTRIBUTING](CONTRIBUTING.md) for more information.

## License

This library is licensed under the MIT-0 License. See the [LICENSE](LICENSE) file.
