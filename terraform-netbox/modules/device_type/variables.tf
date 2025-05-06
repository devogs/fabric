variable "device_types" {
  description = "List of device types to create"
  type = list(object({
    model           = string
    manufacturer_id = string
  }))
}

variable "manufacturer_ids" {
  description = "Map of manufacturer names to their IDs"
  type        = map(string)
}