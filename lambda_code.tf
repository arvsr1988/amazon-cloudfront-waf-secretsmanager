resource "aws_s3_bucket_object" "lambda_python_deps" {
  bucket=var.s3_bucket_for_lambda
  key= local.python_request_layer_key
  source = "${path.module}/artifacts/python-requests-lambda-layer.zip"
  content_type = "application/zip"
}

resource "aws_s3_bucket_object" "lambda_function_code" {
  bucket=var.s3_bucket_for_lambda
  key= local.artifact_lambda_code_key
  source = "${path.module}/artifacts/origin-secret-rotate.zip"
  content_type = "application/zip"
}