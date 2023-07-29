variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
  default     = "alnitak"
}

variable "image_id" {
  type        = string
  description = "ID of the image for create instance"
  default     = "fd87bs5724r0ngu3jlb6"
}

variable "labels" {
  type        = map(string)
  description = "Set labels to objects"
}

variable "resources" {
  type        = object({
    cpu       = number
    memory    = number
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

locals {
  preffix     = "slurm-"
}
