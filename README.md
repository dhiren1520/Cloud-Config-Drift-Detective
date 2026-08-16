# Cloud Configuration Drift Detective

## About the Project

This project is about detecting configuration drift in AWS infrastructure.

The idea is simple: I first create a secure infrastructure using Terraform, which becomes my "golden" or expected configuration. Then AWS Config continuously monitors those resources. If someone (or even I) changes the configuration manually from the AWS Console, the system detects the change and sends an alert.

This project helped me understand how real companies monitor and protect their cloud infrastructure instead of just deploying resources.

---

## What I'm Building

- A Security Group that allows SSH only from my IP address
- An S3 bucket with versioning enabled
- AWS Config to monitor configuration changes
- A Lambda function to check whether the resources are still compliant
- Amazon SNS to send an email whenever configuration drift is detected

---

## Technologies Used

- AWS IAM
- Terraform
- AWS Config
- AWS Lambda
- Amazon SNS
- Amazon S3
- EC2 Security Groups
- Git
- VS Code

---

## Project Structure

```
Cloud-Configuration-Drift-Detective/

├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── README.md
└── .gitignore
```

---

## Progress

### Day 1
- Installed Terraform
- Installed AWS CLI
- Configured AWS credentials
- Created the project structure
- Initialized Git repository

### Day 2 (In Progress)
- Creating the Security Group
- Creating the S3 bucket
- Enabling versioning
- Deploying resources using Terraform

---

## Commands I Use

Initialize Terraform

```bash
terraform init
```

Validate configuration

```bash
terraform validate
```

Preview changes

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply
```

Destroy everything

```bash
terraform destroy
```

---

## Why I Chose This Project

Most beginner AWS projects focus on hosting websites or building simple applications. I wanted to work on something that is closer to what Cloud and DevOps engineers actually do.

This project helped me learn Infrastructure as Code, cloud security, configuration monitoring, and AWS governance in a practical way.

---

## Author

**Dhiren C P**

Learning Cloud DevOps 
