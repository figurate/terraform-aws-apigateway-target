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
| description | An optional description of the integration | `any` | `null` | no |
| function\_name | Name of the target lambda function | `any` | n/a | yes |
| integration\_method | Method used to invoke the target | `string` | `"ANY"` | no |

## Outputs

| Name | Description |
|------|-------------|
| integration\_id | n/a |

