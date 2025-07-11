# Deploy Serverless Lambda using Terraform

<p align="center"><img src="img/EKS-Terraform.jpg" width="50%"></p>

----

This repo provides the Terraform configuration to deploy an AWS Lambda. AWS Lambda is a serverless compute service for running code without having to provision or manage servers. Terraform is a tool to manage your infrastructure as code so rather than provisioning an EKS cluster manually, you can use terraform to provision them for you.

----

## Prerequisites


##### Install AWS CLI

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip
rm -rf aws
```

##### Install Terraform

```
TF_VERSION=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].version' | grep -v 'rc|beta|alpha' | tail -1)

curl -LO "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"
unzip terraform_${TF_VERSION}_linux_amd64.zip
sudo mv -f terraform /usr/local/bin/
rm terraform_${TF_VERSION}_linux_amd64.zip
```

##### Connect Terraform with AWS

```
aws configure
```

## Create AWS Serverless Lambda

```
git clone https://github.com/jeromebrasseur/aws-serverless-lambda.git
cd aws-serverless-lambda
terraform init
terraform plan
terraform apply
```
