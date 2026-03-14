output "vm_id" {
  description = "The ID of the created VM"
  value       = proxmox_vm_qemu.ubuntu-vm.vmid
}

output "vm_name" {
  description = "The name of the created VM"
  value       = proxmox_vm_qemu.ubuntu-vm.name
}

output "vm_ip" {
  description = "The default IPv4 address of the created VM"
  value       = proxmox_vm_qemu.ubuntu-vm.default_ipv4_address
}

