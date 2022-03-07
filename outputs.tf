resource "local_file" "Inventory" {
  content = templatefile("outputs/inventory.yml.tmpl", {
    nodes = upcloud_server.node_cluster.*.hostname,
    controller_public = upcloud_server.controller.network_interface[0].ip_address,
    controller_private = upcloud_server.controller.network_interface[1].ip_address,
    registry_public = upcloud_server.registry.network_interface[0].ip_address,
    registry_private = upcloud_server.registry.network_interface[1].ip_address,
    metrics_public = upcloud_server.metrics.network_interface[0].ip_address,
    metrics_private = upcloud_server.metrics.network_interface[1].ip_address,
    nodes_public = upcloud_server.node_cluster.*.network_interface[*][0].ip_address,
    nodes_private = upcloud_server.node_cluster.*.network_interface[*][1].ip_address,    
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
    cs_admin_email = var.cs_admin_email,
    cs_admin_password = random_string.cs_admin_password.result,
    nsone_public = upcloud_server.nsone.network_interface[0].ip_address,
    nstwo_public = upcloud_server.nstwo.network_interface[0].ip_address,
    primary_nameserver_domain = format("%s.%s", var.primary_nameserver_domain, var.primary_nameserver_zone),
    secondary_nameserver_domain = format("%s.%s", var.secondary_nameserver_domain, var.secondary_nameserver_zone)
  })
  filename = "result/inventory.yml"
}

resource "local_file" "dns_settings" {
  content = templatefile("outputs/dns_settings.txt.tmpl", {
    cs_app_url = format("%s.%s", var.cs_app_url, var.zone_name),
    cs_portal_domain = format("%s.%s", var.cs_portal_domain, var.zone_name),
    cs_registry_domain = format("%s.%s", var.cs_registry_domain, var.zone_name),
    cs_metrics_domain = format("%s.%s", var.cs_metrics_domain, var.zone_name),
    nodes_public = upcloud_server.node_cluster.*.network_interface[*][0].ip_address,
    controller_public = upcloud_server.controller.network_interface[0].ip_address,
    registry_public = upcloud_server.registry.network_interface[0].ip_address,
    metrics_public = upcloud_server.metrics.network_interface[0].ip_address,
    floating_ip = upcloud_floating_ip_address.cluster_vip.ip_address,
    nsone_public = upcloud_server.nsone.network_interface[0].ip_address,
    nstwo_public = upcloud_server.nstwo.network_interface[0].ip_address,
    primary_nameserver_domain = format("%s.%s", var.primary_nameserver_domain, var.primary_nameserver_zone),
    secondary_nameserver_domain = format("%s.%s", var.secondary_nameserver_domain, var.secondary_nameserver_zone)
  })
  filename = "result/dns_settings.txt"
}
