variable "upcloud_username" {
  type = string
}
variable "upcloud_password" {
  type = string
}

variable "region" {
  type = string
  default = "us-sjo1"
}

variable "ssh_keys" {
  type = list
  default = []
}

##
# Virtual Machine Image Selection

variable "debian_init_script" {
  type = string
  default = "apt update && apt -y install openssl ca-certificates linux-headers-amd64 python3 python3-pip python3-openssl python3-apt && pip3 install ansible"
}

variable "debian_template_id" {
  type = string
  default = "01000000-0000-4000-8000-000020060100"
}

variable "private_network" {
  type = string
  default = "10.0.0.0/21"
}

variable "private_network_gateway" {
  type = string
  default = "10.0.0.1" # /24
}

# Controller
variable "plan_controller" {
  type = string
  default = "4xCPU-8GB"
}
variable "plan_controller_disk" {
  type = number
  default = 160 # Disk included with the '4xCPU-8GB' plan.
}

# Node
variable "node_count" {
  type = number
  default = 1
}
# Used to create a consistent naming scheme for our nodes.
# This is for our recommend hostname scheme for nodes:
# * 3 digits for each node, following an identifier like 'node'.
# * 1st digit is the region (e.g. 1, 2, 3)
# * 2nd digit is the availability-zone
# * 3rd digit is the node.
variable "node_base_name" {
  type = string
  default = "10" # '10' would create node101, node102, node103, etc.
}
variable "plan_node" {
  type = string
  default = "2xCPU-4GB"
}
variable "plan_node_disk" {
  type = number
  default = 80
}

##
# PowerDNS
variable "plan_nameserver" {
  type = string
  default = "1xCPU-1GB"
}
variable "plan_nameserver_disk" {
  type = number
  default = 25
}
variable "region_nstwo" {
  type = string
  default = "us-nyc1"
}

variable "primary_nameserver_zone" {
  type = string
  default = ""
}

variable "secondary_nameserver_zone" {
  type = string
  default = ""
}
variable "primary_nameserver_domain" {
  type = string
  default = ""
}

variable "secondary_nameserver_domain" {
  type = string
  default = ""
}

# Backup
variable "plan_backup" {
  type = string
  default = "2xCPU-4GB"
}
variable "plan_backup_disk" {
  type = number
  default = 80
}

# Prometheus & Loki
variable "plan_metrics" {
  type = string
  default = "2xCPU-4GB"
}

variable "plan_metrics_disk" {
  type = number
  default = 80
}

# Registry
variable "plan_registry" {
  type = string
  default = "2xCPU-4GB"
}

variable "plan_registry_disk" {
  type = number
  default = 80
}

##
# ComputeStacks
variable "region_name" {
  type = string
  default = "upcloud"
}
variable "zone_name" {
  type = string
}
variable "cs_app_url" {
  type = string
  default = "a.upcloud"
}
variable "cs_currency" {
  type = string
  default = "USD"
}
variable "cs_network_range" {
  type = string
  default = "10.100.0.0/21"
}
variable "cs_portal_domain" {
  type = string
  default = "portal.upcloud"
}
variable "cs_registry_domain" {
  type = string
  default = "cr.upcloud"
}
variable "cs_metrics_domain" {
  type = string
  default = "metrics.upcloud"
}

# Admin User
variable "cs_admin_email" {
  type = string
  default = "root@localhost"
}
