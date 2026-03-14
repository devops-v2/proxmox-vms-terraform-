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

module "wireguard-vpn" {
  source = "../../../modules/microk8s_vm"

  name           = "wireguard-vpn"
  desc           = "wireguard-vpn"
  target_node    = "machine-1"
  cores          = 2
  memory         = 2048
  scsi0_disk_size = 12
  vmid           = 200
}

