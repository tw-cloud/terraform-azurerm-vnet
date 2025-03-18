variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "name" {
  description = "The name of the subnet."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes that are used for the subnet."
  type        = list(string)
}

variable "service_endpoints" {
  description = "The service endpoints that are used for the subnet."
  type        = list(string)
  default     = []
}

variable "delegation" {
  description = "The delegation information for the subnet."
  type = list(object({
    name = string
    service_delegation = list(object({
      name    = string
      actions = list(string)
    }))
  }))
  default = []
}