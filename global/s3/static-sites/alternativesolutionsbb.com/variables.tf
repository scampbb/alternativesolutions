#####
#This section is for Global Parameters
#####
variable "region" {
  description = "The AWS Region to use"
  default     = "us-east-1"
}

#####
#This section is for Resource Tagging Parameters
#####
variable "owner" {
  description = "The person that has accountability for the resource"
  default     = "fjf"
}

variable "application_role" {
  description = "Describes the function of this resource"
  default     = "static-site"
}

variable "application_id" {
  description = "Resources that are related to the application"
  default     = "s3Bucket"
}

variable "tier" {
  description = "The subnet tier to which the resource is deployed, pub, app or db"
  default     = "pub"
}

variable "managedBy" {
  description = "What manages this resource configuration, defaults is terraform"
  default     = "terraform"
}

#####
#This section contains Parameters for Route53 DNS entires
#####
variable "root_zone" {
  description = "route53 zone: ex. foo.example.com"
  default     = "alternativesolutionsbb.com"
}

variable "domain_alias_name" {
  description = "Root Domain Route53 Alias entry to S3 Bucket"
  default     = "s3-website-us-east-1.amazonaws.com"
}

variable "domain_alias_zoneid" {
  description = "A reference to the S3 bucket’s existing zone identifier"
  default     = "aws_s3_bucket.us_east_1.hosted_zone_id"
}

variable "redirectbucket" {
  description = "hostname to redirect all website requests for this bucket to website bucket"
  default     = "www"
}

#####
#This section contains Parameters for the S3 Website Bucket
#####
variable "index_file" {
  default = "index.html"
}

variable "error_file" {
  default = "error.html"
}
