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
  default     = "elastictranscoder"
}

variable "application_role" {
  description = "Describes the function for this resource"
  default     = "pipeline"
}

#####
#This section is for Elastic Transcoder_pipeline Parameters
#####
variable "input_bucket" {
  description = "The Amazon S3 bucket in which you saved the media files to be transcoded"
  default     = "gpstudios.video-upload"
}

variable "output_bucket" {
  description = "The Amazon S3 bucket in which you want Elastic Transcoder to save the transcoded files."
  default     = "gpstudios.video-transcoded"
}

variable "bucket" {
  description = "The Amazon S3 bucket in which you want Elastic Transcoder to save thumbnail files"
  default     = "gpstudios.video-thumbnails"
}

variable "transcoded_storage_class" {
  description = "The Amazon S3 storage class to assign to the files and playlists that Elastic Transcoder stores in Amazon S3 bucket."
  default     = "Standard"
}

variable "thumbnail_storage_class" {
  description = "The Amazon S3 storage class to assign to the thumbnails that Elastic Transcoder stores in the Amazon S3 bucket."
  default     = "ReducedRedundancy"
}

#####
#This section is for Elastic Transcoder role policy Parameters
#####
variable "policy" {
  description = "The IAM Policy to be attached to the role"
  default     = "arn:aws:iam::aws:policy/service-role/AmazonElasticTranscoderRole"
}
