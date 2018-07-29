#####
#S3Bucket Outputs
#####
output "arn" {
  description = "The ARN of the bucket"
  value       = "${aws_s3_bucket.s3-bucket.arn}"
}
