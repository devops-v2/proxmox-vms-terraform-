# Output VM IDs, Names, and IPs for All Modules
output "vm_ids" {
  description = "The VM IDs of all created VMs"
  value = [
    module.k3s-node-1.vm_id,
    module.k3s-node-2.vm_id,
    module.k3s-node-3.vm_id,
  ]
}

output "vm_names" {
  description = "The VM Names of all created VMs"
  value = [
    module.k3s-node-1.vm_name,
    module.k3s-node-2.vm_name,
    module.k3s-node-3.vm_name,
  ]
}

output "vm_ips" {
  description = "The IP addresses of all created VMs"
  value = [
    module.k3s-node-1.vm_ip,
    module.k3s-node-2.vm_ip,
    module.k3s-node-3.vm_ip,
  ]
}
