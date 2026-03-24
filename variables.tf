variable "domain" {
  type        = string
  description = "Domain name to lookup zone id"
}

variable "enabled" {
  type        = bool
  description = "Whether this module is enabled"
  default     = true
}

variable "spf_policy" {
  description = <<-EOT
    Structured SPF policy.

    Common mechanisms are modeled explicitly:
    - includes       => include:<domain>
    - ip4_cidrs      => ip4:<cidr>
    - ip6_cidrs      => ip6:<cidr>
    - include_a      => bare 'a'
    - a_domains      => a:<domain>
    - include_mx     => bare 'mx'
    - mx_domains     => mx:<domain>
    - exists         => exists:<domain-spec>
    - ptr_domains    => ptr:<domain>
    - exp            => exp=<domain-spec>
    - redirect       => redirect=<domain>
    - all_qualifier  => one of +, -, ~, ?
  EOT

  type = object({
    includes      = optional(list(string), ["include:spf.messagingengine.com"])
    ip4_cidrs     = optional(list(string), [])
    ip6_cidrs     = optional(list(string), [])
    include_a     = optional(bool, false)
    a_domains     = optional(list(string), [])
    include_mx    = optional(bool, false)
    mx_domains    = optional(list(string), [])
    exists        = optional(list(string), [])
    ptr_domains   = optional(list(string), [])
    exp           = optional(string)
    redirect      = optional(string)
    all_qualifier = optional(string, "-")
  })

  default = {}

  validation {
    condition = (
      try(var.spf_policy.all_qualifier, null) == null ||
      contains(["+", "-", "~", "?"], var.spf_policy.all_qualifier)
    )
    error_message = "spf_policy.all_qualifier must be one of: +, -, ~, ?"
  }

  validation {
    condition = !(
      try(var.spf_policy.redirect, null) != null &&
      try(var.spf_policy.all_qualifier, null) != null
    )
    error_message = "spf_policy.redirect and spf_policy.all_qualifier are mutually exclusive."
  }

  validation {
    condition = (
      length(try(var.spf_policy.includes, [])) +
      (try(var.spf_policy.include_a, false) ? 1 : 0) +
      length(try(var.spf_policy.a_domains, [])) +
      (try(var.spf_policy.include_mx, false) ? 1 : 0) +
      length(try(var.spf_policy.mx_domains, [])) +
      length(try(var.spf_policy.exists, [])) +
      length(try(var.spf_policy.ptr_domains, [])) +
      (try(var.spf_policy.redirect, null) != null ? 1 : 0)
    ) <= 10
    error_message = "Direct SPF DNS-lookup-causing terms exceed 10. Reduce include/a/mx/exists/ptr/redirect usage."
  }
}
