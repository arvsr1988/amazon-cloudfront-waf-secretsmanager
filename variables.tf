variable "s3_bucket_for_lambda" { type=string }
variable "s3_prefix_for_lambda" { type=string }
variable "name_prefix" {
  type=string
  default="secret-manager-rotation"
}
variable "origin_url" {type=string}
variable "secret_rotation_interval" {
  type=string
  default="7"
}
variable "header_name" {
  type = string
  default="x-origin-verify"
}
variable "cloudfront_distribution_id" {type=string}
variable "waf_regex_pattern_name" {type=string}
variable "waf_regex_pattern_id" {type=string}
variable "secret_arn" {type=string}