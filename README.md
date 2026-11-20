# Deploy a Linux EC2 Web Server using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) by deploying a Linux EC2 web server on AWS using Terraform.

The EC2 instance is configured automatically using User Data to install and start the Apache web server and host a custom webpage.

## Technologies Used

- AWS EC2
- AWS VPC
- AWS Subnets
- AWS Security Groups
- Terraform
- Linux Ubuntu
- Bash scripting
- Apache Web Server

## Architecture

- AWS Region: Mumbai (ap-south-1)
- EC2 Instance: t2.micro
- Existing VPC reused
- Existing public subnet reused
- Existing security group reused
- Apache installed through User Data

## Deployment Steps

1. Configure AWS CLI credentials.

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Validate the configuration:

   ```bash
   terraform validate
   ```

4. Preview the infrastructure:

   ```bash
   terraform plan
   ```

5. Deploy:

   ```bash
   terraform apply
   ```

## Website

Public URL: http://65.0.29.11

## Outcome

Successfully deployed a Linux EC2 web server using Terraform. Apache was installed automatically during instance initialization, and the webpage was accessible through the EC2 public IP.

## Version Control Workflow

This project uses Git for version control.

- Main branch contains the stable version.
- Feature branches are used for development.
- Changes are committed and pushed to GitHub.
- Pull Requests are created to review and merge changes into the main branch.
