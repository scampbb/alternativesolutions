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
variable "cost_centre" {
  description = "The Organization to which costs may be charged for accounting purposes"
  default     = "gpstudios"
}

variable "application_role" {
  description = "Describes the function for this resource"
  default     = "video-upload"
}

variable "application_id" {
  description = "This AWS resources type that is related to the application"
  default     = "s3Bucket"
}

variable "tier" {
  description = "This tag help with security tracking, is the resource publicly accessible, Options: public or private"
  default     = "public"
}

variable "managedBy" {
  description = "What manages this resource configuration, defaults is terraform"
  default     = "terraform"
}
