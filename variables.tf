variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region in which the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnets that are associated with the virtual network."
  type = map(object({
    address_prefixes  = list(string)
    service_endpoints = optional(list(string), [])
    delegation = list(object({
      name = string
      service_delegation = list(object({
        name    = string
        actions = list(string)
      }))
    }))
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}