<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.34.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.34.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | git@github.com:terraform-aws-modules/terraform-aws-ec2-instance.git | v4.1.4 |
| <a name="module_sg"></a> [sg](#module\_sg) | git@github.com:terraform-aws-modules/terraform-aws-security-group.git | v4.13.1 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_ami.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Public IP of the server | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region to create the resources. | `string` | `"us-east-1"` | no |
| <a name="input_server_disk_size"></a> [server\_disk\_size](#input\_server\_disk\_size) | Disk size of the server in GiB. | `number` | `50` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the EC2 instance to be created. | `string` | n/a | yes |
| <a name="input_server_size"></a> [server\_size](#input\_server\_size) | Size of the server to be created. Acceptable values: small, medium, large. | `string` | n/a | yes |
| <a name="input_use_fixed_ip"></a> [use\_fixed\_ip](#input\_use\_fixed\_ip) | Use a fixed IP to the server. Not using makes it more expensive when server is stoped. | `bool` | `false` | no |
| <a name="input_use_spot"></a> [use\_spot](#input\_use\_spot) | Uses spot instance to run the server.<br>    This is not recommended since the server can be dropped at any time and all the server progress will be lost.<br>    Use this only if you want to run for a small period and to spend way less money. | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->