output "manufacturer_ids" {
  description = "Map of manufacturer names to their IDs"
  value       = module.manufacturer.manufacturer_ids
}

output "device_role_ids" {
  description = "Map of device role names to their IDs"
  value       = module.device_role.role_ids
}

output "platform_ids" {
  description = "Map of platform names to their IDs"
  value       = module.platform.platform_ids
}

output "device_type_ids" {
  description = "Map of device type models to their IDs"
  value       = module.device_type.device_type_ids
}

output "tenant_ids" {
  description = "Map of tenant names to their IDs"
  value       = module.tenant.tenant_ids
}

output "vrf_ids" {
  description = "Map of VRF names to their IDs"
  value       = module.vrf.vrf_ids
}

output "site_ids" {
  description = "Map of site names to their IDs"
  value       = module.site.site_ids
}

output "prefix_ids" {
  description = "Map of prefix values to their IDs"
  value       = module.ipam.prefix_ids
}

output "device_ids" {
  description = "Map of device names to their IDs"
  value       = module.device.device_ids
}