resource "local_file" "Inventory" {
	content = templatefile("inventory.yml.tmpl", {
		nodes = upcloud_server.node_cluster.*.hostname,
		nodes_public = upcloud_server.node_cluster.*.network_interface[*][0].ip_address,
		nodes_private = upcloud_server.node_cluster.*.network_interface[*][1].ip_address,
		controller_public = upcloud_server.controller.network_interface[0].ip_address,
		controller_private = upcloud_server.controller.network_interface[1].ip_address,
		backup_public = upcloud_server.backup.network_interface[0].ip_address,
		backup_private = upcloud_server.backup.network_interface[1].ip_address,
		pg_pass = random_string.pg_password.result,
		loki_pass = random_string.loki_password.result,
		prom_pass = random_string.prometheus_password.result,
		backup_key = random_string.backup_key.result,
		floating_ip = upcloud_floating_ip_address.cluster_vip.ip_address
	})
	filename = "inventory.yml"
}
