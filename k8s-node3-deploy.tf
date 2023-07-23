resource "proxmox_vm_qemu" "k8s_node_3" {

    # k8s-node-3 settings
    name = "k8s-node-3"
    desc = "Kubernetes controller"
    vmid = 103
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
  provisioner "local-exec" {
              # add ip address to dynamic Ansible inventory
    command = "printf '\n${self.default_ipv4_address}' >> k8s_nodes.txt"
  }
}
output "proxmox_ip_address_k8s_node_3" {
      description = "Current IP Default"
      value = proxmox_vm_qemu.k8s_node_3.*.default_ipv4_address
}
