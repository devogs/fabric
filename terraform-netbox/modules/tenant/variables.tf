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