#####
#Cloud Provider Parameters
#####
provider "aws" {
  region  = "${var.region}"
  profile = "as"
}

#Terraform remotestate file storage configuration on AWS S3
terraform {
  backend "s3" {
    profile = "as"
    bucket  = "fjf-terraform-remotestate-backend"
    key     = "environment/development/serverless-transcoder-workshop/services/lambda/get-s3upload-policy/terraform.tfstate"
    region  = "us-east-1"
  }
}
