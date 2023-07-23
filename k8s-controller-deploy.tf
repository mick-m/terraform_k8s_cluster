# Proxmox Full
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "k8s_controller" {

    # k8s-controller settings
    name = "k8s-controller"
    tags = "k8s-controllers"
    desc = "Kubernetes controller"
    vmid = 100
    target_node = "pve"

    # VM Advanced General Settings
    onboot = true

    # VM OS Settings
    clone = "k8s-node"

    # VM System Settings
    agent = 1

    # VM CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"

    # VM Memory Settings
    memory = 2048

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"

    # (Optional) Default User
    # ciuser = "your-username"

    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF

  provisioner "local-exec" {
              # add ip address to dynamic Ansible inventory and wait for instance to be up and ready before proceeding
    command = "printf '\n${self.default_ipv4_address}' >> k8s_controller.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "sed -iE '/^[0-9]/d' k8s_controller.txt"
  }
}

output "proxmox_ip_address_k8s_controller" {
      description = "Current IP Default"
      value = proxmox_vm_qemu.k8s_controller.*.default_ipv4_address
}
