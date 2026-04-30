variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "template_name" {
  type = string
}

variable "target_node" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "scsi0_disk_size" {
  type = number
}
