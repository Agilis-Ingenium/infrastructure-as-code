# Infrastructure as Code (IaC)

## Prelimanary Steps

These steps are done manually for inital setup:

### AWS Account
- [X] Create an AWS account
- [X] Create AWS Access Key Pair for Github
- [X] Put AWS Access Key Pair in repo's secrets

### Transfer Domain
- [X] Domain was registered in another account, therefore transfer ownership to this account (manual, time consuming)
- [X] Manually configure the ACM certificates for the domain

### Terraform the Backend
- [X] Create Terraform backend
  - [X] S3 Bucket for state files (nubadoo-terraform-state-bucket)
    - [X] Enable versioning on bucket
  - [X] Creeate the DynamoDB table (nubadoo-terraform-state)
  - [X] See **backend/main.tf** for Terraform code to perform this
  - [X] Run the GH Actions workflow "Backend" _manually_ from the GH console (only ever run this once ❗)
  - [X] Successfully run - the backend is in place 🧑‍🚀
     
The AWS account is setup, the domain is ready, the Terraform backend is in place... All set 🚀
     
#### Sources: 
- [https://www.youtube.com/watch?v=FTgvgKT09qM](https://www.youtube.com/watch?v=FTgvgKT09qM)
- [https://angelo-malatacca83.medium.com/aws-terraform-s3-and-dynamodb-backend-3b28431a76c1](https://angelo-malatacca83.medium.com/aws-terraform-s3-and-dynamodb-backend-3b28431a76c1)

## AWS Infra

### S3 Static Hosting (aws-infra)

The following components are in terraform solution:

1. acm.tf - this creates a certificate in ue-east-1 (Virginia region).  This is so that the solution has certificates for SSL traffic.
2. cloudfront.tf - this create a CloudFront CDN. It distributes content efficiently and has security features like WAF.
3. main.tf - this file has the providers and we also specify the backend details - this will change
4. outputs.tf - this file gives us access to technical details we need about the solution
5. route53.tf - this configures the DNS records to point at the right places
6. s3.tf - this creates a bucket with a configuration designed for hosting static websites
7. variables.tf - these are variables / parameters we want to pass into the terraform before it runs

An image of the solution:

![aws-infra-s3-static-hosting.png](img/aws-infra-s3-static-hosting.png)

## Elephant SQL Infra

### Database

1. The Terraform module in **elephant_sql_infra/main.tf** create an instance of a **tiny_turtle** (free) database in eu-west-1 (Ireland)

## Github Actions


     

