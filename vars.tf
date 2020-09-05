variable "api_id" {
  description = "Identifier of API to associated with the route"
}

variable "description" {
  description = "An optional description of the integration"
  default     = null
}

variable "integration_type" {
  description = "Target type"
}

variable "integration_uri" {
  description = "URI of the target"
}

variable "integration_method" {
  description = "Method used to invoke the target"
  default     = "ANY"
}

variable "connection_id" {
  description = "Identifier of VPC link used to access private resources"
  default     = null
}

variable "connection_type" {
  description = "Connectivity to the target"
  default     = "INTERNET"
}
