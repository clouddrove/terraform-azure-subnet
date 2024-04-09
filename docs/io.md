## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allocation\_method | Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| create\_nat\_gateway | Flag to control nat gateway creation. | `bool` | `false` | no |
| delegation | Configuration delegations on subnet<br>object({<br>  name = object({<br>    name = string,<br>    actions = list(string)<br>  })<br>}) | `map(list(any))` | `{}` | no |
| disable\_bgp\_route\_propagation | Boolean flag which controls propagation of routes learned by BGP on that route table. | `bool` | `false` | no |
| enable | Flag to control the module creation | `bool` | `true` | no |
| enable\_route\_table | Flag to control route table creation. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `null` | no |
| extra\_tags | Variable to pass extra tags. | `map(string)` | `null` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| location | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `null` | no |
| managedby | ManagedBy, eg 'CloudDrove'. | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `null` | no |
| nat\_gateway\_idle\_timeout | Idle timeout configuration in minutes for Nat Gateway | `number` | `4` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-azure-subnet.git"` | no |
| resource\_group\_name | The name of an existing resource group to be imported. | `string` | `null` | no |
| route\_table\_name | The name of the route table. | `string` | `null` | no |
| routes | List of objects that represent the configuration of each route. | `list(map(string))` | `[]` | no |
| service\_endpoint\_policy\_ids | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `null` | no |
| service\_endpoints | A map with key (string) `subnet name`, value (list(string)) to indicate enabled service endpoints on the subnet. Default value is []. | `list(string)` | `[]` | no |
| sku | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| sku\_name | The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard. | `string` | `"Standard"` | no |
| specific\_name\_subnet | fName of the specific subnet. | `bool` | `false` | no |
| specific\_subnet\_names | A list of subnets inside the vNet. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| subnet\_enforce\_private\_link\_endpoint\_network\_policies | A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false. | `bool` | `false` | no |
| subnet\_enforce\_private\_link\_service\_network\_policies | A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false. | `bool` | `true` | no |
| subnet\_names | A list of public subnets inside the vNet. | `list(string)` | `[]` | no |
| subnet\_prefixes | The address prefix to use for the subnet. | `list(string)` | `[]` | no |
| virtual\_network\_name | The name of the virtual network in which the subnet is created in | `string` | `null` | no |
| zones | Public ip Zones to configure. | `list(string)` | `null` | no |

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
| specific\_subnet\_id | The name of the subnet. |
| specific\_subnet\_name | The name of the subnet. |

