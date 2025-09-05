module "wrapper_efs" {
  source = "../../"

  metadata = local.metadata

  efs_parameters = {
    "00" = {
      # deny_nonsecure_transport_via_mount_target = false
      # vpc_name    = "" # Default: ${local.common_name} (dmc-prd)
      # subnet_name = "" # Default: ${local.common_name}-private* (dmc-prd-private*)
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
}