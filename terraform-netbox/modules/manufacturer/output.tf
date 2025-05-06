output "manufacturer_ids" {
  description = "Map of manufacturer names to their IDs"
  value       = { for k, v in netbox_manufacturer.manufacturer : k => v.id }
}