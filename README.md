# AWS Database Acceleration Toolkit (DAT) 
Welcome to the **AWS Database Acceleration Toolkit (DAT)** !!! 

The **AWS Database Acceleration Toolkit(DAT)** is an open-source Infrastructure-as-a-code based single click solution to simplify and automate initial setup, provisioning and on-going maintenance for [Amazon Aurora](https://aws.amazon.com/rds/aurora/) database on AWS Cloud. 

It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases to Amazon Aurora database and operating these databases in production.

## Architecture

![image](docs/images/DAT-Architecture-new.png)

## Documentation

To explore the complete project documentation, please visit our [documentation](https://aws-samples.github.io/aws-database-acceleration-toolkit/) site.

## Intended audience

The intended audiences for DAT are AWS customers who are migrating from commercial databases to Amazon Aurora.

## Key Features

Key features of DAT include automation of initial Amazon Aurora setup, provisioning and on-going maintenance activities,
1. Provisioning of new [Amazon Aurora database cluster](https://aws.amazon.com/rds/aurora/)
2. Provisioning and Integration with [RDS Proxy](https://aws.amazon.com/rds/proxy/) to reuse database connections and improved reliability
3. Provisioning of new [Amazon Aurora Global Database](https://aws.amazon.com/rds/aurora/global-database/)
4. Monitoring Aurora database 
	1. Amazon CloudWatch
	2. Curated CloudWatch Dashboards for database monitoring
5. Restore cluster from Snapshot 

## Usage Examples

DAT comprises of below examples. Click each link to get more details on running these examples.

1. [aurora-mysql-cluster-existing-vpc](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-mysql-cluster-existing-vpc) - Creates new Amazon Aurora MySQL Cluster.
2. [aurora-mysql-cluster-global-db](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-mysql-cluster-global-db) - Creates new Amazon Aurora MySQL Clusters in Primary and Secondary region.
3. [aurora-mysql-cluster-latest-snapshot](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-mysql-cluster-latest-snapshot) - Deploys the Amazon Aurora MySQL Database Cluster from the latest cluster snapshot
4. [aurora-mysql-dbproxy](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-mysql-dbproxy) - Creates proxy to existing Amazon Aurora MySQL.
5. [aurora-mysql-monitoring](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-mysql-monitoring) - Setup monitoring dashboard for Amazon Aurora MySQL.
6. [aurora-postgres-cluster-existing-vpc](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-existing-vpc) - Creates new Amazon Aurora PostgreSQL Cluster.
7. [aurora-postgres-cluster-global-db](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-global-db) - Creates new Amazon Aurora PostgreSQL Clusters in Primary and Secondary region.
8. [aurora-postgres-cluster-latest-snapshot](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/main/examples/aurora-postgres-cluster-latest-snapshot) - Deploys the Amazon Aurora PostgreSQL Database Cluster from the latest cluster snapshot
9. [aurora-postgres-dbproxy](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/mythili-updates/examples/aurora-postgres-dbproxy) - Creates proxy to existing Amazon Aurora PostgreSQL.
10. [aurora-postgres-monitoring](https://github.com/aws-samples/aws-database-acceleration-toolkit/tree/mythili-updates/examples/aurora-mysql-monitoring) - Setup monitoring dashboard for Amazon Aurora PostgreSQL.

## Getting Started

This section demonstrate how you can leverage DAT to provision new database cluster.

## Prerequisites

First, ensure that you have installed the following tools locally.

1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. [Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
3. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## DAT Deployment
DAT modules can be deployed using any one of the following options

1. [Deployment using Terraform CLI](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_cli.md)
2. [Deployment using new Jenkins](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_new_jenkins.md)
3. [Deployment using existing Jenkins](https://github.com/aws-samples/aws-database-acceleration-toolkit/blob/main/docs/deployment_using_existing_jenkins.md)

## Associated Cost

DAT is an open-source solution and is completely free to use. However, you will be responsible for any AWS costs associated with running your Aurora clusters and other AWS services.

## Support 

DAT is supported by Solution Architects of AWS on best effort basis. However, users are encouraged to ask questions, open issues, contribute and provide feedback on DAT.

## Next Steps

Currently, DAT supports PostgreSQL only. MySQL database engine is on the short-term roadmap. 

## Contributing

The core team for AWS Database Acceleration Toolkit (DAT) include the following, in alphabetical order:

* KK (Krishna) Venkateswaran
* Mitesh Purohit
* Munish Dabra
* Mythili Annamalai Sekar
* Piyush Mattoo
* Prithvi Reddy
* Ravi Mathur

However, we welcome the wider open-source community to this project. See [CONTRIBUTING](CONTRIBUTING.md) for more information.

## License

This library is licensed under the MIT-0 License. See the [LICENSE](LICENSE) file.
