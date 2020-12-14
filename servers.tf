resource "upcloud_server" "controller" {
  zone = var.region
  hostname = "controller"
  plan = var.plan_controller
  login {
    user = "root"
    keys = var.ssh_keys
    create_password = false
  }
  storage_devices {
    size = var.plan_controller_disk
    storage = var.template_id
    tier = "maxiops"
    action = "clone"
  }
	user_data = var.init_script
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
  storage_devices {
    size = var.plan_backup_disk
    storage = var.template_id
    tier = "maxiops"
    action = "clone"
  }
	user_data = var.init_script
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
  storage_devices {
    size = var.plan_node_disk
    storage = var.template_id
    tier = "maxiops"
    action = "clone"
  }
	network_interface {
		type = "public"
	}
	network_interface {
		type = "private"
		network = upcloud_network.cs_network.id
		source_ip_filtering = false
	}
	user_data = var.init_script
}
