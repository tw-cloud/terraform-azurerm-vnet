variable "source_network" {
  type = object({
    resource_group_name          = string
    virtual_network_name         = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, true)
    allow_gateway_transit        = optional(bool, true)
    use_remote_gateways          = optional(bool, false)
  })
}

variable "target_network" {
  type = object({
    resource_group_name          = string
    virtual_network_name         = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, true)
    allow_gateway_transit        = optional(bool, true)
    use_remote_gateways          = optional(bool, false)
    peer_back                    = optional(bool, true)
  })
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default = {}
}