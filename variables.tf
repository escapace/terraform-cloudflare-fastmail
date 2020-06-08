variable "domain" {
  type        = string
  description = "Domain name to lookup zone id"
}

variable "spf_include" {
  type        = list(string)
  description = "SPF record list"
  default = [
    "include:spf.messagingengine.com",
  ]
}

variable "enabled" {
  type    = bool
  default = true
}
