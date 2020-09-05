module "target" {
  source = "../.."

  api_id             = var.api_id
  description        = var.description
  integration_type   = "HTTP_PROXY"
  integration_uri    = var.target_url
  integration_method = var.integration_method
}
