terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_device_role" "role" {
  for_each = { for role in var.device_roles : role.name => role }

  name      = each.value.name
  color_hex = each.value.color_hex
}