<!-- BEGIN_TF_DOCS -->

## Inputs

| Name       | Description                                                                                                                                                                                                                                                                                                                                                                                                                | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Default | Required |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| domain     | Domain name to lookup zone id                                                                                                                                                                                                                                                                                                                                                                                              | `string`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | n/a     |   yes    |
| enabled    | Whether this module is enabled                                                                                                                                                                                                                                                                                                                                                                                             | `bool`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | `true`  |    no    |
| spf_policy | Structured SPF policy. Common mechanisms are modeled explicitly: - includes => include:<domain> - ip4_cidrs => ip4:<cidr> - ip6_cidrs => ip6:<cidr> - include_a => bare 'a' - a_domains => a:<domain> - include_mx => bare 'mx' - mx_domains => mx:<domain> - exists => exists:<domain-spec> - ptr_domains => ptr:<domain> - exp => exp=<domain-spec> - redirect => redirect=<domain> - all_qualifier => one of +, -, ~, ? | `object({ includes = optional(list(string), ["include:spf.messagingengine.com"]) ip4_cidrs = optional(list(string), []) ip6_cidrs = optional(list(string), []) include_a = optional(bool, false) a_domains = optional(list(string), []) include_mx = optional(bool, false) mx_domains = optional(list(string), []) exists = optional(list(string), []) ptr_domains = optional(list(string), []) exp = optional(string) redirect = optional(string) all_qualifier = optional(string, "-") })` | `{}`    |    no    |

## Outputs

| Name    | Description        |
| ------- | ------------------ |
| zone_id | Cloudflare Zone Id |

## Resources

| Name                                                                                                                                  | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [cloudflare_dns_record.caldav](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)        | resource    |
| [cloudflare_dns_record.caldavs](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)       | resource    |
| [cloudflare_dns_record.carddav](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)       | resource    |
| [cloudflare_dns_record.carddavs](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)      | resource    |
| [cloudflare_dns_record.fm1_domainkey](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource    |
| [cloudflare_dns_record.fm2_domainkey](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource    |
| [cloudflare_dns_record.fm3_domainkey](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record) | resource    |
| [cloudflare_dns_record.imap](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)          | resource    |
| [cloudflare_dns_record.imaps](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)         | resource    |
| [cloudflare_dns_record.jmap](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)          | resource    |
| [cloudflare_dns_record.mx_record10](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)   | resource    |
| [cloudflare_dns_record.mx_record20](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)   | resource    |
| [cloudflare_dns_record.pop3](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)          | resource    |
| [cloudflare_dns_record.pop3s](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)         | resource    |
| [cloudflare_dns_record.spf_txt](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)       | resource    |
| [cloudflare_dns_record.submission](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/dns_record)    | resource    |
| [cloudflare_zones.default](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zones)              | data source |

## Requirements

| Name       | Version  |
| ---------- | -------- |
| terraform  | >=1.14.0 |
| cloudflare | >=5.18.0 |

<!-- END_TF_DOCS -->
