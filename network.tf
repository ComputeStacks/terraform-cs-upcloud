resource "upcloud_network" "cs_network" {
  name = "cs_network"
  zone = var.region

  ip_network {
    address = var.private_network
    dhcp = true
    dhcp_default_route = false
    family  = "IPv4"
    gateway = var.private_network_gateway
  }
}

resource "upcloud_floating_ip_address" "cluster_vip" {
	mac_address = upcloud_server.node_cluster[0].network_interface[0].mac_address
}
