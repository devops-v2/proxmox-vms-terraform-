variable "name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "description" {
  description = "The description of the virtual machine"
  type        = string
}

variable "vmid" {
  description = "The unique ID of the VM"
  type        = number
}

variable "target_node" {
  description = "The target Proxmox node"
  type        = string
}

variable "cores" {
  description = "The number of CPU cores"
  type        = number
}

variable "memory" {
  description = "The memory allocated to the virtual machine in MB"
  type        = number
}

variable "scsi0_disk_size" {
  description = "The size of the scsi0 disk in GB"
  type        = number
}

variable "ip_address" {
  description = "The static IP address for the VM"
  type        = string
}

variable "cidr" {
  description = "The CIDR prefix for the subnet"
  type        = number
  default     = 24
}

variable "gateway" {
  description = "The gateway IP address"
  type        = string
}

