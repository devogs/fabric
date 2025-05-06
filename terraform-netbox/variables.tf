variable "netbox_server_url" {
  description = "URL of the Netbox server"
  type        = string
}

variable "netbox_api_token" {
  description = "API token for Netbox"
  type        = string
  sensitive   = true
}

variable "manufacturers" {
  description = "List of manufacturers to create"
  type = list(object({
    name = string
  }))
}

variable "device_roles" {
  description = "List of device roles to create"
  type = list(object({
    name      = string
    color_hex = string
  }))
}

variable "platforms" {
  description = "List of platforms to create"
  type = list(object({
    name            = string
    manufacturer_id = string
  }))
}

variable "device_types" {
  description = "List of device types to create"
  type = list(object({
    model           = string
    manufacturer_id = string
  }))
}

variable "tenant_groups" {
  description = "List of tenant groups to create"
  type = list(object({
    name        = string
    description = string
  }))
}

variable "tenants" {
  description = "List of tenants to create"
  type = list(object({
    name        = string
    group_id    = string
    description = string
  }))
}

variable "vrfs" {
  description = "List of VRFs to create"
  type = list(object({
    name        = string
    rd          = string
    description = string
    tenant_id   = string
  }))
}

variable "regions" {
  description = "List of regions to create"
  type = list(object({
    name        = string
    description = string
  }))
}

variable "site_groups" {
  description = "List of site groups to create"
  type = list(object({
    name        = string
    description = string
  }))
}

variable "sites" {
  description = "List of sites to create"
  type = list(object({
    name        = string
    facility    = string
    latitude    = string
    longitude   = string
    status      = string
    timezone    = string
    region_id   = string
    group_id    = string
    tenant_id   = string
    description = string
  }))
}

variable "locations" {
  description = "List of locations to create"
  type = list(object({
    name        = string
    description = string
    site_id     = string
    tenant_id   = string
  }))
}

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

# variable "devices" {
#   description = "List of devices to create"
#   type = list(object({
#     name           = string
#     device_type_id = string
#     role_id        = string
#     site_id        = string
#   }))
# }