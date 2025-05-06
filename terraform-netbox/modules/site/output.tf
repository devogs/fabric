output "region_ids" {
  description = "Map of region names to their IDs"
  value       = { for k, v in netbox_region.region : k => v.id }
}

output "site_group_ids" {
  description = "Map of site group names to their IDs"
  value       = { for k, v in netbox_site_group.site_group : k => v.id }
}

output "site_ids" {
  description = "Map of site names to their IDs"
  value       = { for k, v in netbox_site.site : k => v.id }
}

output "location_ids" {
  description = "Map of location names to their IDs"
  value       = { for k, v in netbox_location.location : k => v.id }
}