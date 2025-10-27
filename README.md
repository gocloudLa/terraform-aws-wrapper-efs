# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform EFS Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-efs/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-efs.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-efs.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-efs/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform Wrapper for EFS simplifies the creation of Amazon's Elastic File System (NFS compatibility) service, creates mount points in the private subnets, and exposes connection endpoints (exported directories).

### ✨ Features



### 🔗 External Modules
| Name | Version |
|------|------:|
| <a href="https://github.com/terraform-aws-modules/terraform-aws-efs" target="_blank">terraform-aws-modules/efs/aws</a> | 2.0.0 |



## 🚀 Quick Start
```hcl
efs_parameters = {
    # vpc_name    = "" # Default: ${local.common_name} (dmc-prd)
    # subnet_name = "" # Default: ${local.common_name}-private* (dmc-prd-private*)
    "00" = {
      access_points = {
        "root" = {
          root_directory = {
            path = "/"
            creation_info = {
              owner_gid   = 1001
              owner_uid   = 1001
              permissions = "755"
            }
          }
        }
        "example" = {
          root_directory = {
            path = "/example"
            creation_info = {
              owner_gid   = 1001
              owner_uid   = 1001
              permissions = "755"
            }
          }
        }
      }
    }
  }
  efs_defaults = var.efs_defaults
```


## 🔧 Additional Features Usage



## 📑 Inputs
| Name                                      | Description                                                                                                                                             | Type     | Default                                              | Required |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ---------------------------------------------------- | -------- |
| name                                      | Name of the EFS                                                                                                                                         | `string` | `"${local.common_name}-${each.key}"`                 | no       |
| access_points                             | Access points configuration                                                                                                                             | `map`    | `{}`                                                 | no       |
| attach_policy                             | Whether to attach a policy to the EFS                                                                                                                   | `bool`   | `true`                                               | no       |
| availability_zone_name                    | Name of the availability zone                                                                                                                           | `string` | `null`                                               | no       |
| bypass_policy_lockout_safety_check        | Bypass lockout safety check for policies                                                                                                                | `bool`   | `null`                                               | no       |
| create                                    | Whether to create the EFS                                                                                                                               | `bool`   | `true`                                               | no       |
| create_backup_policy                      | Whether to create a backup policy for the EFS                                                                                                           | `bool`   | `true`                                               | no       |
| create_replication_configuration          | Whether to create replication configuration for the EFS                                                                                                 | `bool`   | `false`                                              | no       |
| create_security_group                     | Whether to create a security group for the EFS                                                                                                          | `bool`   | `true`                                               | no       |
| creation_token                            | Token for EFS creation                                                                                                                                  | `string` | `null`                                               | no       |
| deny_nonsecure_transport                  | Deny insecure transport to the EFS                                                                                                                      | `bool`   | `true`                                               | no       |
| enable_backup_policy                      | Enables backup policy for the EFS                                                                                                                       | `bool`   | `true`                                               | no       |
| encrypted                                 | Whether the EFS is encrypted                                                                                                                            | `bool`   | `true`                                               | no       |
| kms_key_arn                               | ARN of the KMS key used for encryption                                                                                                                  | `string` | `null`                                               | no       |
| lifecycle_policy                          | Lifecycle policy for EFS                                                                                                                                | `map`    | `{}`                                                 | no       |
| mount_targets                             | Mount targets for the EFS                                                                                                                               | `list`   | `local.default_mount_targets`                        | no       |
| override_policy_documents                 | Policy documents that override default policies                                                                                                         | `list`   | `[]`                                                 | no       |
| performance_mode                          | Performance mode of the EFS                                                                                                                             | `string` | `null`                                               | no       |
| policy_statements                         | IAM policy statements to attach to the EFS                                                                                                              | `list`   | `[]`                                                 | no       |
| provisioned_throughput_in_mibps           | Provisioned throughput in MiBps                                                                                                                         | `number` | `null`                                               | no       |
| replication_configuration_destination     | Destination for EFS replication configuration                                                                                                           | `map`    | `{}`                                                 | no       |
| security_group_description                | Description of the security group for the EFS                                                                                                           | `string` | `"${local.common_name}-efs-${each.key}"`             | no       |
| security_group_name                       | Name of the security group for the EFS                                                                                                                  | `string` | `"${local.common_name}-efs-${each.key}"`             | no       |
| security_group_rules                      | Security group rules for the EFS                                                                                                                        | `list`   | `local.default_security_group_rules`                 | no       |
| security_group_use_name_prefix            | Whether to use a name prefix for the security group                                                                                                     | `bool`   | `false`                                              | no       |
| security_group_vpc_id                     | VPC ID to associate with the security group                                                                                                             | `string` | `data.aws_vpc.this[each.key].id`                     | no       |
| source_policy_documents                   | Source policy documents for the EFS                                                                                                                     | `list`   | `[]`                                                 | no       |
| throughput_mode                           | Throughput mode for the EFS                                                                                                                             | `string` | `null`                                               | no       |
| vpc_name                                  | (optional) Custom VPC Name                                                                                                                              | `string` | ``${local.common_name}` (dmc-prd)`                   | no       |
| subnet_name                               | (optional) Custom Subnet Filter                                                                                                                         | `string` | ``${local.common_name}-private*` (dmc-prd-private*)` | no       |
| deny_nonsecure_transport_via_mount_target | Determines whether to use the common policy option for denying nonsecure transport which allows all AWS principals when accessed via EFS mounted target | `bool`   | `true`                                               | no       |
| protection                                | A map of file protection configurations                                                                                                                 | `any`    | `{}`                                                 | no       |
| tags                                      | A map of tags to assign to resources.                                                                                                                   | `map`    | `{}`                                                 | no       |








---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 