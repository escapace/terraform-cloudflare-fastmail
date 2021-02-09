data "cloudflare_zones" "default" {
  filter {
    name = var.domain
  }
}

locals {
  zone_id = data.cloudflare_zones.default.zones[0]["id"]
}

resource "cloudflare_record" "mx_record10" {
  count    = var.enabled ? 1 : 0
  zone_id  = local.zone_id
  name     = var.domain
  type     = "MX"
  ttl      = "300"
  value    = "in1-smtp.messagingengine.com"
  priority = 10

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "mx_record20" {
  count    = var.enabled ? 1 : 0
  zone_id  = local.zone_id
  name     = var.domain
  type     = "MX"
  ttl      = "300"
  value    = "in2-smtp.messagingengine.com"
  priority = 20

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "spf_txt" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "TXT"
  ttl     = "300"
  value   = "v=spf1 ${join(" ", var.spf_include)} ?all"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "spf_spf" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SPF"
  ttl     = "300"
  value   = "v=spf1 ${join(" ", var.spf_include)} ?all"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "fm1_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm1._domainkey"
  type    = "CNAME"
  ttl     = "300"
  value   = "fm1.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "fm2_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm2._domainkey"
  type    = "CNAME"
  ttl     = "300"
  value   = "fm2.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "fm3_domainkey" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = "fm3._domainkey"
  type    = "CNAME"
  ttl     = "300"
  value   = "fm3.${var.domain}.dkim.fmhosted.com"

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "caldav" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_caldav"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "caldavs" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_caldavs"
    priority = 0
    weight   = 1
    port     = 443
    target   = "caldav.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "carddav" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_carddav"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "carddavs" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_carddavs"
    priority = 0
    weight   = 1
    port     = 443
    target   = "carddav.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "imap" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_imap"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "imaps" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_imaps"
    priority = 0
    weight   = 1
    port     = 993
    target   = "imap.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "pop3" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_pop3"
    priority = 0
    weight   = 0
    port     = 0
    target   = "."
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "pop3s" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_pop3s"
    priority = 10
    weight   = 1
    port     = 995
    target   = "pop.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "jmap" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_jmap"
    priority = 0
    weight   = 1
    port     = 443
    target   = "jmap.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_record" "submission" {
  count   = var.enabled ? 1 : 0
  zone_id = local.zone_id
  name    = var.domain
  type    = "SRV"
  ttl     = "300"

  data = {
    proto    = "_tcp"
    service  = "_submission"
    priority = 0
    weight   = 1
    port     = 587
    target   = "smtp.fastmail.com"
  }

  lifecycle {
    create_before_destroy = true
  }
}

