output "static_site_arn" {
  description = "The ARN of the bucket."
  value       = "${aws_s3_bucket.static-site.arn}"
}

output "redirectbucket_arn" {
  description = "The ARN of the bucket."
  value       = "${aws_s3_bucket.redirectbucket.arn}"
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = "${aws_s3_bucket.static-site.bucket_domain_name}"
}

output "website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website."
  value       = "${aws_s3_bucket.static-site.website_endpoint}"
}
