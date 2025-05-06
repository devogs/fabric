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

variable "tenant_ids" {
  description = "Map of tenant names to their IDs"
  type        = map(string)
}