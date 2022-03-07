resource "upcloud_server" "controller" {
  zone = var.region
  hostname = "controller"
  plan = var.plan_controller
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_controller_disk
    title = "controller boot"
  }
  user_data = var.debian_init_script
  network_interface {
    type = "public"
  }
  network_interface {
    type = "private"
    network = upcloud_network.cs_network.id
    source_ip_filtering = false
  }
}

resource "upcloud_server" "backup" {
  zone = var.region
  hostname = "backup"
  plan = var.plan_backup
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_backup_disk
    title = "backup boot"
  }
  user_data = var.debian_init_script
  network_interface {
    type = "public"
  }
  network_interface {
    type = "private"
    network = upcloud_network.cs_network.id
    source_ip_filtering = false
  }
}

resource "upcloud_server" "node_cluster" {
  count = var.node_count
  zone = var.region
  hostname = format("node%s%s", var.node_base_name, count.index + 1)
  plan = var.plan_node
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_node_disk
    title = format("node%s%s boot", var.node_base_name, count.index + 1)
  }
  network_interface {
    type = "public"
  }
  network_interface {
    type = "private"
    network = upcloud_network.cs_network.id
    source_ip_filtering = false
  }
  user_data = var.debian_init_script
}

resource "upcloud_server" "metrics" {
  zone = var.region
  hostname = "metrics"
  plan = var.plan_metrics
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_metrics_disk
    title = "metrics boot"
  }
  network_interface {
    type = "public"
  }
  network_interface {
    type = "private"
    network = upcloud_network.cs_network.id
    source_ip_filtering = false
  }
  user_data = var.debian_init_script
}

resource "upcloud_server" "registry" {
  zone = var.region
  hostname = "registry"
  plan = var.plan_registry
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_registry_disk
    title = "registry boot"
  }
  network_interface {
    type = "public"
  }
  network_interface {
    type = "private"
    network = upcloud_network.cs_network.id
    source_ip_filtering = false
  }
  user_data = var.debian_init_script
}

resource "upcloud_server" "nsone" {
  zone = var.region
  hostname = "ns1"
  plan = var.plan_nameserver
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_nameserver_disk
    title = "nsone boot"
  }
  network_interface {
    type = "public"
  }
  user_data = var.debian_init_script
}
resource "upcloud_server" "nstwo" {
  zone = var.region_nstwo
  hostname = "ns2"
  plan = var.plan_nameserver
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  template {
    storage = var.debian_template_id
    size = var.plan_nameserver_disk
    title = "nstwo boot"
  }
  network_interface {
    type = "public"
  }
  user_data = var.debian_init_script
}
