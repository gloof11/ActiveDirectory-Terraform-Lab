terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
    local = {
        source = "hashicorp/local"
      }
  }
}

provider "proxmox" {
  pm_tls_insecure = true
  pm_api_url = "https://proxmox.lan:8006/api2/json"
  pm_api_token_secret = "" # Insert your proxmox API token here
  pm_api_token_id = "root@pam!terraform"
  pm_log_enable = true
  pm_log_file = "terraform-plugin-proxmox.log"
  pm_debug = true
  pm_log_levels = {
      _default = "debug"
      _capturelog = ""
    }
}
