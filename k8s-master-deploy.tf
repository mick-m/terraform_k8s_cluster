# Proxmox Full
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "k8s_controller" {

    # k8s-controller settings
    name = "k8s-controller"
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
    }
