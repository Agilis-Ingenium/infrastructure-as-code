# Infrastructure as Code (IaC)

## Prelimanary Steps

These steps are done manually for inital setup:

- [X] Create an AWS account
- [X] Create AWS Access Key Pair for Github
- [X] Put AWS Access Key Pair in repo's secrets
- [X] Create Terraform backend
  - [X] S3 Bucket for state files (nubadoo-terraform-state-bucket)
  - [X] Enable versioning on bucket
  - [X] Creeate the DynamoDB table (nubadoo-terraform-state)
  - [X] See **backend/main.tf** for code to perform this
  - [ ] 
     
Source: [https://www.youtube.com/watch?v=FTgvgKT09qM](https://www.youtube.com/watch?v=FTgvgKT09qM)
     

