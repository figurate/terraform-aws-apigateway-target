# ![AWS](aws-logo.png) API Gateway Target

Purpose: Provision a configured integration point using templates.

Rationale: Provide simple API gateway targets.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_id | Identifier of API to associated with the route | `any` | n/a | yes |
| connection\_id | Identifier of VPC link used to access private resources | `any` | `null` | no |
| connection\_type | Connectivity to the target | `string` | `"INTERNET"` | no |
| description | An optional description of the integration | `any` | `null` | no |
| integration\_method | Method used to invoke the target | `string` | `"ANY"` | no |
| integration\_type | Target type | `any` | n/a | yes |
| integration\_uri | URI of the target | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| integration\_id | n/a |

