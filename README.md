<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->


<h1 align="center">
    Terraform AZURE SUBNET
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    Terraform module to create subnet resource on AZURE.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.0.0-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-azure-subnet'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AZURE+SUBNET&url=https://github.com/clouddrove/terraform-azure-subnet'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AZURE+SUBNET&url=https://github.com/clouddrove/terraform-azure-subnet'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>





## Prerequisites

This module has a few dependencies: 








**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-azure-subnet/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
### Default Subnet
```hcl
  module "subnet" {
    source               = "clouddrove/subnet/azure"
    name                 = "app"
    environment          = "test"
    label_order          = ["name", "environment"]
    resource_group_name  = module.resource_group.resource_group_name
    location             = module.resource_group.resource_group_location
    virtual_network_name = join("", module.vnet.vnet_name)

    #subnet
    subnet_names        = ["subnet1", "subnet2"]
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]

    # route_table
    routes = [
      {
        name           = "rt-test"
        address_prefix = "0.0.0.0/0"
        next_hop_type  = "Internet"
      }
    ]
  }
```
### Name_Specific Subnet
```hcl
  module "name_specific_subnet" {
    source               = "clouddrove/subnet/azure"
    name                 = "app"
    environment          = "test"
    label_order          = ["name", "environment"]
    resource_group_name  = module.resource_group.resource_group_name
    location             = module.resource_group.resource_group_location
    virtual_network_name = join("", module.vnet.vnet_name)

    #subnet
    specific_name_subnet  = true
    specific_subnet_names = "SpecificSubnet"
    subnet_prefixes       = ["10.0.1.0/24"]

    # route_table
    routes = [
      {
        name           = "rt-test"
        address_prefix = "0.0.0.0/0"
        next_hop_type  = "Internet"
      }
    ]
  }
```
### Nat_Gateway Subnet
```hcl
  module "name_specific_subnet" {
    source               = "clouddrove/subnet/azure"
    name                 = "app"
    environment          = "test"
    label_order          = ["name", "environment"]
    resource_group_name  = module.resource_group.resource_group_name
    location             = module.resource_group.resource_group_location
    virtual_network_name = join("", module.vnet.vnet_name)

    #subnet
    create_nat_gateway  = true
    subnet_names        = ["subnet1", "subnet2"]
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]

    # route_table
    routes = [
      {
        name           = "rt-test"
        address_prefix = "0.0.0.0/0"
        next_hop_type  = "Internet"
      }
    ]
  }
```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| create\_nat\_gateway | Flag to control nat gateway creation. | `bool` | `false` | no |
| delegation | Configuration delegations on subnet<br>object({<br>  name = object({<br>    name = string,<br>    actions = list(string)<br>  })<br>}) | `map(list(any))` | `{}` | no |
| delimiter | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| disable\_bgp\_route\_propagation | Boolean flag which controls propagation of routes learned by BGP on that route table. | `bool` | `false` | no |
| enable | Flag to control the module creation | `bool` | `true` | no |
| enable\_route\_table | Flag to control route table creation. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `""` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| nat\_gateway\_idle\_timeout | Idle timeout configuration in minutes for Nat Gateway | `number` | `4` | no |
| public\_ip\_zones | Public ip Zones to configure. | `list(string)` | `null` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-azure-subnet.git"` | no |
| resource\_group\_name | The name of an existing resource group to be imported. | `string` | `""` | no |
| route\_table\_name | The name of the route table. | `string` | `""` | no |
| routes | List of objects that represent the configuration of each route. | `list(map(string))` | `[]` | no |
| service\_endpoints | A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []. | `list(string)` | `[]` | no |
| specific\_name\_subnet | n/a | `bool` | `false` | no |
| specific\_subnet\_names | A list of subnets inside the vNet. | `string` | `""` | no |
| subnet\_enforce\_private\_link\_endpoint\_network\_policies | A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false. | `map(bool)` | `{}` | no |
| subnet\_enforce\_private\_link\_service\_network\_policies | A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false. | `bool` | `true` | no |
| subnet\_names | A list of public subnets inside the vNet. | `list(string)` | `[]` | no |
| subnet\_prefixes | The address prefix to use for the subnet. | `list(string)` | `[]` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| virtual\_network\_name | The name of the virtual network in which the subnet is created in | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_subnet\_address\_prefixes | The address prefixes for the subnet. |
| default\_subnet\_id | The subnet ID. |
| default\_subnet\_name | The name of the subnet. |
| nat\_gateway\_id | The ID of the NAT Gateway. |
| public\_ip\_address | The IP address value that was allocated. |
| public\_ip\_id | The ID of this Public IP. |
| route\_table\_associated\_subnets | The collection of Subnets associated with this route table. |
| route\_table\_id | The Route Table ID. |
| specific\_subnet\_address\_prefixes | The address prefixes for the subnet. |
| specific\_subnet\_id | The subnet ID. |
| specific\_subnet\_name | The name of the subnet. |






## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-azure-subnet/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-azure-subnet)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
