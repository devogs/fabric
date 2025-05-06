variable "ipam_roles" {
  description = "List of IPAM roles to create"
  type = list(object({
    name = string
  }))
}

variable "prefixes" {
  description = "List of IP prefixes to create"
  type = list(object({
    prefix      = string
    status      = string
    description = string
    is_pool     = bool
    role_id     = string
    site_id     = string
    tenant_id   = string
    vrf_id      = string
  }))
}

variable "site_ids" {
  description = "Map of site names to their IDs"
  type        = map(string)
}

variable "tenant_ids" {
  description = "Map of tenant names to their IDs"
  type        = map(string)
}

variable "vrf_ids" {
  description = "Map of VRF names to their IDs"
  type        = map(string)
}