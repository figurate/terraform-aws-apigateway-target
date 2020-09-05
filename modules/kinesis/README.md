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
| integration\_method | Method used to invoke the target | `string` | `"ANY"` | no |
| stream\_name | Name of a Kinesis stream target | `any` | n/a | yes |

## Outputs

No output.

