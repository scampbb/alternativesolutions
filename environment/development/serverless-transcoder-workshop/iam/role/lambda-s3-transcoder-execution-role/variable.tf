#####
#This section is for Global Parameters
#####
variable "region" {
  description = "The AWS Region to use"
  default     = "us-east-1"
}


#####
#This section is for IAM Role Parameters
#####
variable "lambda_policy" {
  description = "The IAM Policy to be attached to the role"
  default     = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

variable "transcoder_JobsSubmitter_policy" {
  description = "The IAM Policy to be attached to the role"
  default     = "arn:aws:iam::aws:policy/AmazonElasticTranscoder_JobsSubmitter"
}