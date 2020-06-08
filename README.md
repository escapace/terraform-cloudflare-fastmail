## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| cloudflare | >= 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| cloudflare | >= 2.4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain | Domain name to lookup zone id | `string` | n/a | yes |
| enabled | n/a | `bool` | `true` | no |
| spf\_include | SPF record list | `list(string)` | <pre>[<br>  "include:spf.messagingengine.com"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| zone\_id | Cloudflare Zone Id |

