variable "device_configs" {
  description = "List of device configurations including interfaces and IP addresses"
  type = list(object({
    name        = string
    device_type = string
    role        = string
    site        = string
    tenant      = string
    interfaces  = list(object({
      name        = string
      type        = string
      description = string
      enabled     = bool
      mtu         = number
      mgmtonly    = bool
      vrf         = string
      ip_addresses = list(object({
        ip_address = string
        status     = string
        vrf        = string
      }))
    }))
  }))
}

variable "device_type_ids" {
  description = "Map of device type models to their IDs"
  type        = map(string)
}

variable "role_ids" {
  description = "Map of device role names to their IDs"
  type        = map(string)
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