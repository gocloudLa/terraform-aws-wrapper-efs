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
| [terraform-aws-modules/efs/aws](https://github.com/terraform-aws-modules/efs-aws) | 1.8.0 |



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










---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la
- 🐛 **Issues**: [GitHub Issues](https://github.com/gocloudLa/issues)

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 