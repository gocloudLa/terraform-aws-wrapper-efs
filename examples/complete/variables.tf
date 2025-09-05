/*----------------------------------------------------------------------*/
/* RDS | Variable Definition                                            */
/*----------------------------------------------------------------------*/

variable "efs_defaults" {
  description = "Map of default values which will be used for each efs."
  type        = any
  default     = {}
}

variable "efs_parameters" {
  description = "Maps of rds databases to create a wrapper from. Values are passed through to the module."
  type        = any
  default     = {}
}