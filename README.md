# Superset Deployment using Terraform

## Introduction
This Terraform script deploys Apache Superset in a Kubernetes cluster on AWS.

## Prerequisites
- AWS account with necessary permissions
- Kubernetes cluster
- AWS CLI and kubectl configured
- Terraform installed

## Design Decisions
- Chose EKS for scalability and ease of integration with AWS services.
- Used Kubernetes for container orchestration to manage Superset deployment efficiently.

## Usage
1. Clone the repository: `git clone <repo-url>`
2. Navigate to the terraform directory: `cd terraform`
3. Initialize Terraform: `terraform init`
4. Apply the configuration: `terraform apply`

## Configurable Security

To ensure that only authorized users can deploy and modify the Superset infrastructure, we have implemented IAM policies and roles.

### IAM Role and Policy

An IAM role `SupersetDeploymentRole` is created with the following permissions:
- EKS management
- EC2 management
- Elastic Load Balancing management
- Ability to pass roles

### Usage

1. Only users with the `SupersetDeploymentRole` can deploy and modify the Superset infrastructure.
2. Ensure you have the necessary IAM permissions to assume this role before running the Terraform scripts.

### Steps to Assume Role

1. Authenticate to AWS CLI:
   ```sh
   aws configure

