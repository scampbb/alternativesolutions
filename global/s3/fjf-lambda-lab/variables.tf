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
  default     = "lambda-lab"
}

variable "application_id" {
  description = "Resources that are related to the application"
  default     = "s3Bucket"
}

variable "tier" {
  description = "The subnet tier to which the resource is deployed, pub, app or db"
  default     = "pri"
}

variable "managedBy" {
  description = "What manages this resource configuration, defaults is terraform"
  default     = "terraform"
}
