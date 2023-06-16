variable "api_id" {
  description = "Identifier of API to associated with the route"
}

variable "description" {
  description = "An optional description of the integration"
  default     = null
}

variable "integration_method" {
  description = "Method used to invoke the target"
  default     = "ANY"
}
