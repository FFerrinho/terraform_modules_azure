# Key Vault Module for Azure
1. [Requirements](#requirements)
2. [Usage](#usage)
3. [Notes](#notes)
----
## Requirements
To run this module you need to have Terraform, above v1.1.3 and also the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) provider configured.
Configuration in Terraform can be as follows:
``` yaml
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}
```
## Usage
Check the variables.tf file to see all the available variables and basic usage instructions for each variable. Further information can be found at the [Terraform Registry for Azure Key Vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault).

To invoke the module from your Terraform file, you need the block:
``` yaml
module "your_module_name" {
  source = /the/path/for/the/module

  name = your_custom_resource_name
  [...]
}
```
## Notes
The block for [access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#access_policy) isn't available in this module, since it's a resource that can be used on its own. Thus, it is better to manage it independently and associate it with the Key Vault resource.
