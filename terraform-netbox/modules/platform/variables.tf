variable "platforms" {
  description = "List of platforms to create"
  type = list(object({
    name            = string
    manufacturer_id = string
  }))
}

variable "manufacturer_ids" {
  description = "Map of manufacturer names to their IDs"
  type        = map(string)
}