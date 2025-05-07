terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

resource "netbox_device" "device" {
  for_each = { for device in var.device_configs : device.name => device }

  name           = each.value.name
  device_type_id = var.device_type_ids[each.value.device_type]
  role_id        = var.role_ids[each.value.role]
  site_id        = var.site_ids[each.value.site]
  tenant_id      = try(var.tenant_ids[each.value.tenant], null)
}

resource "netbox_device_interface" "interface" {
  for_each = {
    for iface in flatten([
      for device in var.device_configs : [
        for interface in device.interfaces : {
          key = "${device.name}_${interface.name}"
          device_name = device.name
          name = interface.name
          type = interface.type
          description = interface.description
          enabled = interface.enabled
          mtu = interface.mtu
          mgmtonly = interface.mgmtonly
          vrf = interface.vrf
        }
      ]
    ]) : iface.key => iface
  }

  name        = each.value.name
  device_id   = netbox_device.device[each.value.device_name].id
  type        = each.value.type
  description = each.value.description
  enabled     = each.value.enabled
  mtu         = each.value.mtu
  mgmtonly    = each.value.mgmtonly
}

resource "netbox_ip_address" "ip_address" {
  for_each = {
    for tuple in flatten([
      for device in var.device_configs : [
        for interface in device.interfaces : [
          for ip in interface.ip_addresses : {
            key = "${device.name}_${interface.name}_${ip.ip_address}"
            device_name = device.name
            interface_name = interface.name
            ip_address = ip.ip_address
            status = ip.status
            vrf = ip.vrf
          }
        ]
      ]
    ]) : tuple.key => tuple
  }

  ip_address   = each.value.ip_address
  status       = each.value.status
  interface_id = netbox_device_interface.interface["${each.value.device_name}_${each.value.interface_name}"].id
  object_type  = "dcim.interface"
  vrf_id       = var.vrf_ids[each.value.vrf]
}

resource "netbox_device_primary_ip" "primary_ip" {
  for_each = {
    for device in var.device_configs :
    device.name => device
    if length([
      for iface in device.interfaces : iface
      if iface.mgmtonly == true && length(iface.ip_addresses) > 0
    ]) > 0
  }

  device_id      = netbox_device.device[each.value.name].id
  ip_address_id  = [
    for ip in flatten([
      for iface in each.value.interfaces : [
        for ip_addr in iface.ip_addresses : {
          key = "${each.value.name}_${iface.name}_${ip_addr.ip_address}"
          ip_address = ip_addr.ip_address
        } if iface.mgmtonly == true
      ]
    ]) : netbox_ip_address.ip_address[ip.key].id
  ][0]  # Select first IP from mgmtonly interface
}