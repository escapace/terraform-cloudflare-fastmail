data "cloudflare_zones" "default" {
  name = var.domain
}

locals {
  zone_id = data.cloudflare_zones.default.result[0]["id"]
}

resource "cloudflare_dns_record" "mx_record10" {
  count    = var.enabled ? 1 : 0
  zone_id  = local.zone_id
  name     = var.domain
  type     = "MX"
  ttl      = 300
  content  = "in1-smtp.messagingengine.com"
  priority = 10

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "mx_record20" {
  count    = var.enabled ? 1 : 0
  zone_id  = local.zone_id
  name     = var.domain
  type     = "MX"
  ttl      = 300
  content  = "in2-smtp.messagingengine.com"
  priority = 20

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "spf_txt" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "TXT"
  ttl     = 300
  content = "v=spf1 ${join(" ", var.spf_include)} ?all"

  lifecycle {
    create_before_destroy = true
  }
}

# resource "cloudflare_record" "spf_spf" {
#   count   = var.enabled ? 1 : 0
#   zone_id = local.zone_id
#   name    = var.domain
#   type    = "SPF"
#   ttl     = 300
#   content = "v=spf1 ${join(" ", var.spf_include)} ?all"
#
#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "cloudflare_dns_record" "fm1_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm1._domainkey"
  type    = "CNAME"
  ttl     = 300
  content = "fm1.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "fm2_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm2._domainkey"
  type    = "CNAME"
  ttl     = 300
  content = "fm2.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "fm3_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm3._domainkey"
  type    = "CNAME"
  ttl     = 300
  content = "fm3.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_dns_record" "caldav" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_caldav._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_caldav._tcp.${var.domain}"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "caldavs" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_caldavs._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_caldavs._tcp.${var.domain}"
    priority = 0
    weight   = 1
    port     = 443
    target   = "caldav.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "carddav" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_carddav._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_carddav._tcp.${var.domain}"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "carddavs" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_carddavs._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_carddavs._tcp.${var.domain}"
    priority = 0
    weight   = 1
    port     = 443
    target   = "carddav.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "imap" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_imap._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_imap._tcp.${var.domain}"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "imaps" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_imaps._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_imaps._tcp.${var.domain}"
    priority = 0
    weight   = 1
    port     = 993
    target   = "imap.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "pop3" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_pop3._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_pop3._tcp.${var.domain}"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "pop3s" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_pop3s._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_pop3s._tcp.${var.domain}"
    priority = 10
    weight   = 1
    port     = 995
    target   = "pop.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "jmap" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_jmap._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_jmap._tcp.${var.domain}"
    priority = 0
    weight   = 1
    port     = 443
    target   = "jmap.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

resource "cloudflare_dns_record" "submission" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "_submission._tcp"
  type    = "SRV"
  ttl     = 300

  data = {
    name     = "_submission._tcp.${var.domain}"
    priority = 0
    weight   = 1
    port     = 587
    target   = "smtp.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      priority
    ]
  }
}

