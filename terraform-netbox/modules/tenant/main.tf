terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_tenant_group" "group" {
  for_each = { for group in var.tenant_groups : group.name => group }

  name        = each.value.name
  description = each.value.description
}

resource "netbox_tenant" "tenant" {
  for_each = { for tenant in var.tenants : tenant.name => tenant }

  name        = each.value.name
  group_id    = netbox_tenant_group.group[each.value.group_id].id
  description = each.value.description
}