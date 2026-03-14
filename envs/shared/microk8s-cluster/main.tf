terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://192.168.1.35:8006/api2/json"
  pm_api_token_id     = "terraform@pam!terraform"
  pm_api_token_secret = "bdcbd933-8cbf-4c6c-be85-41b0b8f74ba3"
  pm_tls_insecure     = true
}

module "k3s-node-1" {
  source          = "../../../modules/ubuntu_vm"
  name            = "k3s-node-1"
  desc            = "k3s-node-1"
  target_node     = "machine-1"
  cores           = 8
  memory          = 8192
  scsi0_disk_size = 32
  vmid            = 810
  ip_address      = "192.168.1.205"
  cidr            = 24
  gateway         = "192.168.1.1"
}

module "k3s-node-2" {
  source          = "../../../modules/ubuntu_vm"
  name            = "k3s-node-2"
  desc            = "k3s-node-2"
  target_node     = "machine-1"
  cores           = 8
  memory          = 8192
  scsi0_disk_size = 32
  vmid            = 811
  ip_address      = "192.168.1.206"
  cidr            = 24
  gateway         = "192.168.1.1"
}

module "k3s-node-3" {
  source          = "../../../modules/ubuntu_vm"
  name            = "k3s-node-3"
  desc            = "k3s-node-3"
  target_node     = "machine-1"
  cores           = 8
  memory          = 8192
  scsi0_disk_size = 32
  vmid            = 812
  ip_address      = "192.168.1.207"
  cidr            = 24
  gateway         = "192.168.1.1"
}
