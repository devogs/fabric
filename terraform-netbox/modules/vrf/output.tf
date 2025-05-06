output "vrf_ids" {
  description = "Map of VRF names to their IDs"
  value       = { for k, v in netbox_vrf.vrf : k => v.id }
}