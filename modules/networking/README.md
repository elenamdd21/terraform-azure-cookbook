# Networking module

Creates an Azure Virtual Network, one subnet, a Network Security Group (NSG), and associates the NSG with the subnet.

## Security notes
- The module creates no permissive inbound rules by default.
- Define only the rules required by the workload.
- Avoid `source_address_prefix = "*"` for administrative ports such as SSH (22) or RDP (3389).
- This module does not create a public IP, VM, NAT Gateway, route table, or Private Endpoint.

## Inputs
See `variables.tf` for all inputs, types, defaults, and validation.

## Outputs
- `virtual_network_id`
- `virtual_network_name`
- `subnet_id`
- `subnet_name`
- `network_security_group_id`
- `network_security_group_name`

## Usage
```hcl
module "networking" {
  source = "../../modules/networking"

  resource_group_name         = "rg-network-demo"
  location                    = "uksouth"
  virtual_network_name        = "vnet-demo"
  address_space               = ["10.20.0.0/16"]
  subnet_name                 = "snet-app"
  subnet_address_prefixes     = ["10.20.1.0/24"]
  network_security_group_name = "nsg-app"

  security_rules = [{
    name                       = "AllowHttpsInboundFromApprovedRange"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
    description                = "Example only: restrict source range to your approved network."
  }]

  tags = {
    environment = "demo"
    managed_by  = "terraform"
  }
}
```

Review address ranges and security rules for your environment before deployment.
