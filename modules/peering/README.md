## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.peer_source_to_target](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peer_target_to_source](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network.source_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.target_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_source_network"></a> [source\_network](#input\_source\_network) | n/a | <pre>object({<br/>    resource_group_name          = string<br/>    virtual_network_name         = string<br/>    allow_virtual_network_access = optional(bool, true)<br/>    allow_forwarded_traffic      = optional(bool, true)<br/>    allow_gateway_transit        = optional(bool, true)<br/>    use_remote_gateways          = optional(bool, false)<br/>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_target_network"></a> [target\_network](#input\_target\_network) | n/a | <pre>object({<br/>    resource_group_name          = string<br/>    virtual_network_name         = string<br/>    allow_virtual_network_access = optional(bool, true)<br/>    allow_forwarded_traffic      = optional(bool, true)<br/>    allow_gateway_transit        = optional(bool, true)<br/>    use_remote_gateways          = optional(bool, false)<br/>    peer_back                    = optional(bool, true)<br/>  })</pre> | n/a | yes |

## Outputs

No outputs.
