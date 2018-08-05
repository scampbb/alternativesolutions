output "arn" {
  description = "The Amazon Resource Name identifying your Lambda Function."
  value       = "${aws_lambda_function.lambda.arn}"
}
