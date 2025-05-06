terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_vrf" "vrf" {
  for_each = { for vrf in var.vrfs : vrf.name => vrf }

  name        = each.value.name
  rd          = each.value.rd
  description = each.value.description
  tenant_id   = var.tenant_ids[each.value.tenant_id]
}