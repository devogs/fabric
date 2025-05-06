variable "device_roles" {
  description = "List of device roles to create"
  type = list(object({
    name      = string
    color_hex = string
  }))
}