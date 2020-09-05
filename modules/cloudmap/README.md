## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_id | Identifier of API to associated with the route | `any` | n/a | yes |
| description | An optional description of the integration | `any` | `null` | no |
| integration\_method | Method used to invoke the target | `string` | `"ANY"` | no |
| service\_arn | ARN of a CloudMap service target | `any` | n/a | yes |
| vpc\_link | Identifier of VPC link used to access private resources | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| integration\_id | n/a |

