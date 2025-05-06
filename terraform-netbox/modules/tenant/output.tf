output "tenant_group_ids" {
  description = "Map of tenant group names to their IDs"
  value       = { for k, v in netbox_tenant_group.group : k => v.id }
}

output "tenant_ids" {
  description = "Map of tenant names to their IDs"
  value       = { for k, v in netbox_tenant.tenant : k => v.id }
}