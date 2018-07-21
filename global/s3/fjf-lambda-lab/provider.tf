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
    key     = "global/s3/fjf-lambda-lab/terraform.tfstate"
    region  = "us-east-1"
  }
}
