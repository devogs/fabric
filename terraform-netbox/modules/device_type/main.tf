terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_device_type" "device_type" {
  for_each = { for dt in var.device_types : dt.model => dt }

  model           = each.value.model
  manufacturer_id = var.manufacturer_ids[each.value.manufacturer_id]
}