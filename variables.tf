variable "k8s_node_count" {
  type = number
  description = "Number of k8s nodes"
  default = 3
}

variable "k8s_controller_count" {
  type = number
  description = "Number of k8s controllers"
  default = 1
}

variable "inventory_template" {
  type = string
  default = "./templates/inventory.tftpl"
}

variable "my_private_key" {
  type = string
  default = " ~/.ssh/id_ed25519"
}