# Infrastructure as Code (IaC)

## Prelimanary Steps

These steps are done manually for inital setup:

### AWS Account
- [X] Create an AWS account
- [X] Create AWS Access Key Pair for Github
- [X] Put AWS Access Key Pair in repo's secrets

### Terraform the Backend
- [X] Create Terraform backend
  - [X] S3 Bucket for state files (nubadoo-terraform-state-bucket)
    - [X] Enable versioning on bucket
  - [X] Creeate the DynamoDB table (nubadoo-terraform-state)
  - [X] See **backend/main.tf** for Terraform code to perform this
  - [X] Run the GH Actions workflow "Backend" _manually_ from the GH console (only ever run this once ❗)
  - [X] Successfully run - the backend is in place 🧑‍🚀
     
Sources: 
- [https://www.youtube.com/watch?v=FTgvgKT09qM](https://www.youtube.com/watch?v=FTgvgKT09qM)
- [https://angelo-malatacca83.medium.com/aws-terraform-s3-and-dynamodb-backend-3b28431a76c1](https://angelo-malatacca83.medium.com/aws-terraform-s3-and-dynamodb-backend-3b28431a76c1)

### Transfer Domain
- [X] Domain was registered in another account, therefore transfer ownership to this account (manual, time consuming)
     

