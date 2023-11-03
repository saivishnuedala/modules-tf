## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my_server_module_2"></a> [my\_server\_module\_2](#module\_my\_server\_module\_2) | ./modules/webserver | n/a |
| <a name="module_my_vpc_module"></a> [my\_vpc\_module](#module\_my\_vpc\_module) | ./modules/network | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | env name | `string` | `"dev"` | no |

## Outputs

No outputs.
