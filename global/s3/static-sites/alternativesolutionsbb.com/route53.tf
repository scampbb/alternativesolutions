data "aws_route53_zone" "rootzone" {
  name = "${var.root_zone}"
}

#Create A record
resource "aws_route53_record" "static-site" {
  zone_id = "${data.aws_route53_zone.rootzone.zone_id}"
  name    = "${var.root_zone}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.static-site.website_domain}"
    zone_id                = "${aws_s3_bucket.static-site.hosted_zone_id}"
    evaluate_target_health = false
  }
}

#Create CNAME record to point to A record
resource "aws_route53_record" "static-site-cname" {
  zone_id = "${data.aws_route53_zone.rootzone.zone_id}"
  name    = "${var.redirectbucket}"
  type    = "CNAME"
  ttl     = "86400"

  records = [
    "${var.root_zone}",
  ]
}
