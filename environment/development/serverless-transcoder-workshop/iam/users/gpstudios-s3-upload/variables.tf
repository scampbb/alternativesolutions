#####
#This section is for Global Parameters
#####
variable "region" {
  description = "The AWS Region to use"
  default     = "us-east-1"
}

#####
#This section is for IAM User Parameters
#####
variable "user-name" {
  description = "user being created with pattern firstname.lastname"
  default     = "gpstudios-s3-upload"
}

variable "iam_path" {
  description = "Path of where you want to create the IAM resource"
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys"
  default     = "false"
}
