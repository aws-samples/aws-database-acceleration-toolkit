# Database Acceleration Toolkit (DAT)

Welcome to the Database Acceleration Toolkit

Database Acceleration Toolkit is a collection of Terraform modules which simplify and automate initial setup and provisioning (day 1) and on-going maintainance (day 2 operations) for Amazon Aurora database on AWS Cloud. It's designed to minimize the heavy lifting required for AWS customers to migrate from commercial databases such as SQL Server to Amazon Aurora and operating these databases in production.

## Getting Started
Below sample example demonstrate how you can leverage DAT to provision new cluster.

This project provides a set of Terraform modules to provision Aurora database clusters, and enable observability.

- Aurora PostgreSQL cluster with Existing VPC
- Aurora PostgreSQL cluster with RDS Database Proxy 

These modules can be directly configured in your existing Terraform
configurations or ready to be deployed in our packaged
[examples](https://gitlab.aws.dev/mundabra/database-acceleration-toolkit/-/tree/main/examples)

!!! tip
    We have supporting examples for quick setup such as:

    - Creating a new Aurora PostgreSQL Database Cluster provisioned in an existing VPC
    - RDS Database Proxy with Aurora PostgreSQL Cluster