terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_manufacturer" "manufacturer" {
  for_each = { for manu in var.manufacturers : manu.name => manu }

  name = each.value.name
}