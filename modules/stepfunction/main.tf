module "target" {
  source = "../.."

  api_id             = var.api_id
  description        = var.description
  integration_type   = "AWS_PROXY"
  integration_method = var.integration_method
}
