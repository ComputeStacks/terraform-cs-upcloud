resource "local_file" "Inventory" {
	content = templatefile("outputs/inventory.yml.tmpl", {
		nodes = upcloud_server.node_cluster.*.hostname,
		metrics_count = length(upcloud_server.metrics),
		registry_count = length(upcloud_server.registries),
		registry_public = upcloud_server.registries.*.network_interface[*][0].ip_address,
		registry_private = upcloud_server.registries.*.network_interface[*][1].ip_address,
		nodes_public = upcloud_server.node_cluster.*.network_interface[*][0].ip_address,
		nodes_private = upcloud_server.node_cluster.*.network_interface[*][1].ip_address,
		metrics_public = upcloud_server.metrics.*.network_interface[*][0].ip_address,
		metrics_private = upcloud_server.metrics.*.network_interface[*][1].ip_address,
		controller_public = upcloud_server.controller.network_interface[0].ip_address,
		controller_private = upcloud_server.controller.network_interface[1].ip_address,
		backup_public = upcloud_server.backup.network_interface[0].ip_address,
		backup_private = upcloud_server.backup.network_interface[1].ip_address,
		pg_pass = random_string.pg_password.result,
		loki_pass = random_string.loki_password.result,
		prom_pass = random_string.prometheus_password.result,
		backup_key = random_string.backup_key.result,
		floating_ip = upcloud_floating_ip_address.cluster_vip.ip_address,
		app_id = random_string.app_id.result,
		network_name = lower(random_string.network_name.result),
		network_range = var.cs_network_range,
		region_name = var.region_name,
		currency = var.cs_currency,
		zone_name = var.zone_name,
		cs_app_url = format("%s.%s", var.cs_app_url, var.zone_name),
		cs_portal_domain = format("%s.%s", var.cs_portal_domain, var.zone_name),
		cs_registry_domain = format("%s.%s", var.cs_registry_domain, var.zone_name),
		cs_metrics_domain = format("%s.%s", var.cs_metrics_domain, var.zone_name),
		license_key = var.license_key,
		use_zerossl = var.use_zerossl,
		acme_challenge_method = var.acme_challenge_method,
		acme_cf_account = var.acme_cf_account,
		acme_cf_token = var.acme_cf_token,
	})
	filename = "result/inventory.yml"
}

resource "local_file" "dns_settings" {
	content = templatefile("outputs/dns_settings.txt.tmpl", {
		cs_app_url = format("%s.%s", var.cs_app_url, var.zone_name),
		cs_portal_domain = format("%s.%s", var.cs_portal_domain, var.zone_name),
		cs_registry_domain = format("%s.%s", var.cs_registry_domain, var.zone_name),
		cs_metrics_domain = format("%s.%s", var.cs_metrics_domain, var.zone_name),
		registry_count = length(upcloud_server.registries),
		metrics_count = length(upcloud_server.metrics),
		nodes_public = upcloud_server.node_cluster.*.network_interface[*][0].ip_address,
		controller_public = upcloud_server.controller.network_interface[0].ip_address,
		metrics_public = upcloud_server.metrics.*.network_interface[*][0].ip_address,
		registry_public = upcloud_server.registries.*.network_interface[*][0].ip_address,
	})
	filename = "result/dns_settings.txt"
}
