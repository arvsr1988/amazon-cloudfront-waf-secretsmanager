locals {
  python_request_layer_key = "${var.s3_prefix_for_lambda}/python-requests-lambda-layer.zip"
  artifact_lambda_code_key = "${var.s3_prefix_for_lambda}/origin-secret-rotate.zip"
}

resource "aws_cloudformation_stack" "secret_rotation_lambda" {
  name = "${var.name_prefix}-secret-rotation"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_AUTO_EXPAND"]
  template_body = file("${path.module}/templates/cf-origin-verify-sm-only.yaml")
  parameters = {
    OriginVerifySecretArn = var.secret_arn
    ArtifactsPrefix = "${var.s3_prefix_for_lambda}/"
    ArtifactsBucket = var.s3_bucket_for_lambda
    RotateInterval = var.secret_rotation_interval
    HeaderName = var.header_name
    OriginUrl = var.origin_url
    CFDistroId = var.cloudfront_distribution_id
    WAFRegexPatternName = var.waf_regex_pattern_name
    WAFRegexPatternId = var.waf_regex_pattern_id
    OriginVerifySecretArn = var.secret_arn
  }
}

