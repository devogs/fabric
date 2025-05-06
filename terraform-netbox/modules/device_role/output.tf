output "role_ids" {
  description = "Map of device role names to their IDs"
  value       = { for k, v in netbox_device_role.role : k => v.id }
}