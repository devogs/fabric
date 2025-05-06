variable "manufacturers" {
  description = "List of manufacturers to create"
  type = list(object({
    name = string
  }))
}