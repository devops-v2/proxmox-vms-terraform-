terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://192.168.1.35:8006/api2/json"
  pm_api_token_id     = "terraform@pam!terraform"
  pm_api_token_secret = "bdcbd933-8cbf-4c6c-be85-41b0b8f74ba3"
  pm_tls_insecure     = true
}

module "github-actions-agent" {
  source          = "../../../modules/ubuntu_vm"
  name            = "github-actions-agent"
  description     = "github-actions-agent"
  target_node     = "machine-1"
  cores           = 8
  memory          = 4096
  scsi0_disk_size = 20
  vmid            = 9000
  ip_address      = "192.168.1.208"
  cidr            = 24
  gateway         = "192.168.1.1"
}

