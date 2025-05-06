variable "vrfs" {
  description = "List of VRFs to create"
  type = list(object({
    name        = string
    rd          = string
    description = string
    tenant_id   = string
  }))
}

variable "tenant_ids" {
  description = "Map of tenant names to their IDs"
  type        = map(string)
}