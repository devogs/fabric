terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_platform" "platform" {
  for_each = { for platform in var.platforms : platform.name => platform }

  name            = each.value.name
  manufacturer_id = var.manufacturer_ids[each.value.manufacturer_id]
}