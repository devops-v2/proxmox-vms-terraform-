terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

resource "proxmox_vm_qemu" "ubuntu-vm" {
  name          = var.name
  description   = var.description
  target_node   = var.target_node
  vmid          = var.vmid
  clone         = "ubuntu-20.04-template"
  agent         = 1
  os_type       = "cloud-init"
  agent_timeout = 10

  cpu {
    type    = "host"
    cores   = var.cores
    sockets = 1
  }

  memory             = var.memory
  scsihw             = "virtio-scsi-pci"
  full_clone         = true
  start_at_node_boot = true
  hastate            = "started"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size      = var.scsi0_disk_size
          cache     = "writeback"
          storage   = "local-lvm"
          replicate = true
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  boot      = "order=scsi0"
  ipconfig0 = "ip=${var.ip_address}/${var.cidr},gw=${var.gateway}"

  serial {
    id   = 0
    type = "socket"
  }

  ciuser     = "nekoneki"
  cipassword = "4355"
  sshkeys    = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPlgr6HBDD57IgEAR2D+dMnj8u/2It1uo9OkqgfaVQin proxmox-vm
EOF
}
