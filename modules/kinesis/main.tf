data "aws_kinesis_stream" "stream" {
  name = var.stream_name
}

module "target" {
  source = "../.."

  api_id             = var.api_id
  description        = var.description
  integration_type   = "AWS_PROXY"
  integration_uri    = data.aws_kinesis_stream.stream.arn
  integration_method = var.integration_method
}
