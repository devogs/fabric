output "platform_ids" {
  description = "Map of platform names to their IDs"
  value       = { for k, v in netbox_platform.platform : k => v.id }
}