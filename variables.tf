variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "alnitak"
}

variable "vm_count" {
  type        = number
  description = "Count of total virtual machines"
  default     = 3
}

variable "labels" {
  type        = map(string)
  description = "Set labels to objects"
}

variable "resources" {
  type        = object({
    cpu       = number
    memory    = number
    image     = string
    disk      = number
  })
  description = "Configure vm resources"
}

variable "cidr_blocks" {
  type        = list(list(string))
  description = "Declare IP subnet addresses"
}

variable "nlb_port" {
  type = number
}

variable "nlb_healthcheck" {
  type = object({
    name   = string
    path   = string
  })
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "You can set already exist VPC ID"
}

variable "az" {
  type = list(string)
}

locals {
  preffix     = "slurm-"
}