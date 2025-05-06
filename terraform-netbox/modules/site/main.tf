terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_region" "region" {
  for_each = { for region in var.regions : region.name => region }

  name        = each.value.name
  description = each.value.description
}

resource "netbox_site_group" "site_group" {
  for_each = { for group in var.site_groups : group.name => group }

  name        = each.value.name
  description = each.value.description
}

resource "netbox_site" "site" {
  for_each = { for site in var.sites : site.name => site }

  name        = each.value.name
  facility    = each.value.facility
#   latitude    = each.value.latitude
#   longitude   = each.value.longitude
  status      = each.value.status
  timezone    = each.value.timezone
  region_id   = netbox_region.region[each.value.region_id].id
  group_id    = netbox_site_group.site_group[each.value.group_id].id
  tenant_id   = var.tenant_ids[each.value.tenant_id]
  description = each.value.description
}

resource "netbox_location" "location" {
  for_each = { for loc in var.locations : loc.name => loc }

  name        = each.value.name
  description = each.value.description
  site_id     = netbox_site.site[each.value.site_id].id
  tenant_id   = var.tenant_ids[each.value.tenant_id]
}