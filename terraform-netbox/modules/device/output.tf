output "device_ids" {
  description = "Map of device names to their IDs"
  value       = { for k, v in netbox_device.device : k => v.id }
}

output "interface_ids" {
  description = "Map of interface keys (device_name_interface_name) to their IDs"
  value       = { for k, v in netbox_device_interface.interface : k => v.id }
}

output "ip_address_ids" {
  description = "Map of IP address keys (device_name_interface_name_ip_address) to their IDs"
  value       = { for k, v in netbox_ip_address.ip_address : k => v.id }
}