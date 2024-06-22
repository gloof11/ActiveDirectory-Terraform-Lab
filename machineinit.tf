resource "proxmox_vm_qemu" "create-3-dcs" {
  target_node = "ventus"
  count = 2
  name = "LAB-DC-SVR${count.index + 1}"
  agent = 1

  clone = "WindowsServer2016v2"
  full_clone = false
  
  cores = 2
  cpu = "x86-64-v2-AES"
  memory = 2048
  balloon = 0

  disks {
    ide {
        ide0 {
            disk {
                size = 32
                storage = "local-zfs"
              }
          }
      }
  }
  
  tags = "10.0.0.${254 - count.index}"

  lifecycle {
      ignore_changes = all
    }
}

resource "local_file" "hosts_cfg" {
    content = templatefile("hosts.tpl", {
        servers = proxmox_vm_qemu.create-3-dcs.*
      })

    filename = "hosts"
  }
