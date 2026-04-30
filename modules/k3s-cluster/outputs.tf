output "master_ips" {
  value = [for m in module.masters : m.vm_ip]
}

output "worker_ips" {
  value = [for w in module.workers : w.vm_ip]
}
