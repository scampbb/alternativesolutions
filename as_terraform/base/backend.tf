terraform {
  backend "s3" {
    bucket = "as-terraform-remotestate"
    key    = "as_terraform/base"
    region = "us-east-1"
  }
}
