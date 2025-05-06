terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_ipam_role" "role" {
  for_each = { for role in var.ipam_roles : role.name => role }

  name = each.value.name
}

resource "netbox_prefix" "prefix" {
  for_each = { for prefix in var.prefixes : prefix.prefix => prefix }

  prefix      = each.value.prefix
  status      = each.value.status
  description = each.value.description
  is_pool     = each.value.is_pool
  role_id     = netbox_ipam_role.role[each.value.role_id].id
  site_id     = var.site_ids[each.value.site_id]
  tenant_id   = var.tenant_ids[each.value.tenant_id]
  vrf_id      = var.vrf_ids[each.value.vrf_id]
}