# Cloud DevOps Nanodegree Capstone Project

> This project demonstrates a CI/CD pipeline for a micro services application with rolling deployment. In addition, it also demonstrates Continuous Integration using Jenkins

The tasks involved included:
* Working in AWS
* Using Jenkins to implement Continuous Integration and Continuous Deployment
* Building pipelines
* Working with CloudFormation to deploy clusters
* Building Kubernetes clusters
* Building Docker containers in pipelines

## Getting Setup

### Setting up the my Environment

# Built my enviroment using Cloudformation
* Setting up VPC
* Creating Security Groups
* IAM roles for EKSCluster
* Built Jenkins Server using an Ubuntu Image
* EKS Setup

```bash
$ aws cloudformation create-stack --stack-name cap --template-body file://cap/capstone.yaml --region=us-east-2
```

# Jenkins Server
* Stored accounts for docker, aws and github
* Installed Blue Ocean

# Use the following steps as a guideline 
https://medium.com/@andresaaap/how-to-install-docker-aws-cli-eksctl-kubectl-for-jenkins-in-linux-ubuntu-18-04-3e3c4ceeb71
