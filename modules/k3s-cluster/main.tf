module "masters" {
  source = "../vm"
  count  = var.master_count

  name            = "${var.cluster_name}-master-${count.index + 1}"
  description     = "${var.cluster_name} master node ${count.index + 1}"
  template_name   = var.template_name
  target_node     = element(var.proxmox_nodes, count.index)
  cores           = var.cores
  memory          = var.memory
  scsi0_disk_size = var.disk_size
}

module "workers" {
  source = "../vm"
  count  = var.worker_count

  name            = "${var.cluster_name}-worker-${count.index + 1}"
  description     = "${var.cluster_name} worker node ${count.index + 1}"
  template_name   = var.template_name
  target_node     = element(var.proxmox_nodes, count.index)
  cores           = var.cores
  memory          = var.memory
  scsi0_disk_size = var.disk_size
}

