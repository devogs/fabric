output "device_type_ids" {
  description = "Map of device type models to their IDs"
  value       = { for k, v in netbox_device_type.device_type : k => v.id }
}