module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "1.8.0"

  for_each = var.efs_parameters

  name                                  = "${local.common_name}-${each.key}"
  access_points                         = try(each.value.access_points, var.efs_defaults.access_points, {})
  attach_policy                         = try(each.value.attach_policy, var.efs_defaults.attach_policy, true)
  availability_zone_name                = try(each.value.availability_zone_name, var.efs_defaults.availability_zone_name, null)
  bypass_policy_lockout_safety_check    = try(each.value.bypass_policy_lockout_safety_check, var.efs_defaults.bypass_policy_lockout_safety_check, null)
  create                                = try(each.value.create, var.efs_defaults.create, true)
  create_backup_policy                  = try(each.value.create_backup_policy, var.efs_defaults.create_backup_policy, true)
  create_replication_configuration      = try(each.value.create_replication_configuration, var.efs_defaults.create_replication_configuration, false)
  create_security_group                 = try(each.value.create_security_group, var.efs_defaults.create_security_group, true)
  creation_token                        = try(each.value.creation_token, var.efs_defaults.creation_token, null)
  deny_nonsecure_transport              = try(each.value.deny_nonsecure_transport, var.efs_defaults.deny_nonsecure_transport, true)
  enable_backup_policy                  = try(each.value.enable_backup_policy, var.efs_defaults.enable_backup_policy, true)
  encrypted                             = try(each.value.encrypted, var.efs_defaults.encrypted, true)
  kms_key_arn                           = try(each.value.kms_key_arn, var.efs_defaults.kms_key_arn, null)
  lifecycle_policy                      = try(each.value.lifecycle_policy, var.efs_defaults.lifecycle_policy, {})
  mount_targets                         = try(each.value.mount_targets, var.efs_defaults.mount_targets, { for k, v in data.aws_subnets.this[each.key].ids : k => { subnet_id = v } })
  override_policy_documents             = try(each.value.override_policy_documents, var.efs_defaults.override_policy_documents, [])
  performance_mode                      = try(each.value.performance_mode, var.efs_defaults.performance_mode, null)
  policy_statements                     = try(each.value.policy_statements, var.efs_defaults.policy_statements, [])
  provisioned_throughput_in_mibps       = try(each.value.provisioned_throughput_in_mibps, var.efs_defaults.provisioned_throughput_in_mibps, null)
  replication_configuration_destination = try(each.value.replication_configuration_destination, var.efs_defaults.replication_configuration_destination, {})
  security_group_description            = try(each.value.security_group_description, var.efs_defaults.security_group_description, "${local.common_name}-efs-${each.key}")
  security_group_name                   = try(each.value.security_group_name, var.efs_defaults.security_group_name, "${local.common_name}-efs-${each.key}")
  security_group_rules = try(each.value.security_group_rules, var.efs_defaults.security_group_rules, {
    vpc = {
      # relying on the defaults provdied for EFS/NFS (2049/TCP + ingress)
      description = "NFS ingress from VPC"
      cidr_blocks = [data.aws_vpc.this[each.key].cidr_block]
    }
    }
  )
  security_group_use_name_prefix            = try(each.value.security_group_use_name_prefix, var.efs_defaults.security_group_use_name_prefix, false)
  security_group_vpc_id                     = try(each.value.security_group_vpc_id, var.efs_defaults.security_group_vpc_id, data.aws_vpc.this[each.key].id)
  source_policy_documents                   = try(each.value.source_policy_documents, var.efs_defaults.source_policy_documents, [])
  throughput_mode                           = try(each.value.throughput_mode, var.efs_defaults.throughput_mode, null)
  deny_nonsecure_transport_via_mount_target = try(each.value.deny_nonsecure_transport_via_mount_target, var.efs_defaults.deny_nonsecure_transport_via_mount_target, true)
  protection                                = try(each.value.protection, var.efs_defaults.protection, {})

  tags = merge(local.common_tags, try(each.value.tags, var.efs_defaults.tags, null))
}
