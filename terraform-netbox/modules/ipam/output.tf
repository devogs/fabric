output "ipam_role_ids" {
  description = "Map of IPAM role names to their IDs"
  value       = { for k, v in netbox_ipam_role.role : k => v.id }
}

output "prefix_ids" {
  description = "Map of prefix values to their IDs"
  value       = { for k, v in netbox_prefix.prefix : k => v.id }
}