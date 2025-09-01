/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

variable "metadata" {
  type = any
}

variable "project" {
  type = string
}

/*----------------------------------------------------------------------*/
/* EFS | Variable Definition                                            */
/*----------------------------------------------------------------------*/

variable "efs_parameters" {
  type        = any
  description = "Configuration options for EFS"
  default     = {}
}

variable "efs_defaults" {
  type        = any
  description = "Map of default values which will be used for each item"
  default     = {}
}
