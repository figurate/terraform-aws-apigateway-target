module "target" {
  source = "../.."

  api_id             = var.api_id
  description        = var.description
  integration_type   = "HTTP_PROXY"
  integration_uri    = var.service_arn
  integration_method = var.integration_method
  connection_type    = "VPC_LINK"
  connection_id      = var.vpc_link
}
