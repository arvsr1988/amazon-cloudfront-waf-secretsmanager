output "lambda_function_arn" {
  value = aws_cloudformation_stack.secret_rotation_lambda.outputs
}