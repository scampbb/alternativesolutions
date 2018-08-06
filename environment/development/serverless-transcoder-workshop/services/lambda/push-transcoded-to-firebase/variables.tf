#####
#This section is for Global Parameters
#####
variable "region" {
  description = "The AWS Region to use"
  default     = "us-east-1"
}

#####
#This section is for Resource Naming Parameters
#####
variable "cost_centre" {
  description = "The Organization to which costs may be charged for accounting purposes"
  default     = "gpstudios"
}

variable "application_id" {
  description = "This AWS resources type that is related to the application"
  default     = "lambda"
}

variable "application_role" {
  description = "Describes the function for this resource"
  default     = "push-transcoded-to-firebase"
}

variable "managedBy" {
  description = "What manages this resource configuration, defaults is terraform"
  default     = "terraform"
}

#####
#This section is for the Lambda Function Parameters
#####
variable "handler" {
  description = "The function entrypoint in your code."
  default     = "index.handler"
}

variable "role" {
  description = "IAM role attached to the Lambda Function."
  default     = "arn:aws:iam::703728344560:role/lambda-s3-transcoder-execution-role"
}

variable "runtime" {
  description = "The runtime environment for the Lambda function"
  default     = "nodejs6.10"
}

variable "timeout" {
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = "30"
}

#####
#This section is for the S3 triggers & bucket notification Parameters
#####
variable "action" {
  description = "The AWS Lambda action you want to allow in this statement."
  default     = "lambda:InvokeFunction"
}

variable "principal" {
  description = "The principal who is getting this permission"
  default     = "s3.amazonaws.com"
}

variable "trigger_event_source" {
  description = "The S3 bucket that serves as the event source. The bucket must be in the same region as the function."
  default     = "arn:aws:s3:::gpstudios.video-transcoded"
}

variable "bucket" {
  description = "The name of the bucket to put notification configuration."
  default     = "gpstudios.video-transcoded"
}

variable "events" {
  description = "Specifies event for which to send notifications."
  default     = ["s3:ObjectCreated:*"]
}

#####
#This section is for the Environment Variables Parameters
#####
variable "service_account" {
  default = "gpstudios-sfb-firebase-key.json"
}

variable "db_url" {
  default = "https://gpstudios-sfb.firebaseio.com/"
}

variable "transcoded_bucket_url" {
  default = "https://s3.amazonaws.com/gpstudios.video-transcoded"
}
