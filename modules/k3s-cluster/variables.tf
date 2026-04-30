variable "cluster_name" {
  type = string
}

variable "proxmox_nodes" {
  type = list(string)
}

variable "template_name" {
  type = string
}

variable "master_count" {
  type = number
}

variable "worker_count" {
  type = number
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "disk_size" {
  type = number
}
