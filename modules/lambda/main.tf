data "aws_lambda_function" "lambda" {
  function_name = var.function_name
}

module "target" {
  source = "../.."

  api_id             = var.api_id
  description        = var.description
  integration_type   = "AWS_PROXY"
  integration_uri    = data.aws_lambda_function.lambda.invoke_arn
  integration_method = var.integration_method
}
