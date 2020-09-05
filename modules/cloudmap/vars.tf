variable "api_id" {
  description = "Identifier of API to associated with the route"
}

variable "description" {
  description = "An optional description of the integration"
  default     = null
}

variable "vpc_link" {
  description = "Identifier of VPC link used to access private resources"
  default     = null
}

variable "service_arn" {
  description = "ARN of a CloudMap service target"
}

variable "integration_method" {
  description = "Method used to invoke the target"
  default     = "ANY"
}
