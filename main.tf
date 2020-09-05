/**
 * # ![AWS](aws-logo.png) API Gateway Target
 *
 * Purpose: Provision a configured integration point using templates.
 *
 * Rationale: Provide simple API gateway targets.
 */
resource "aws_apigatewayv2_integration" "target" {
  api_id             = var.api_id
  description        = var.description
  integration_type   = var.integration_type
  integration_uri    = var.integration_uri
  integration_method = var.integration_method

  connection_type = var.connection_type
  connection_id   = var.connection_id
}
