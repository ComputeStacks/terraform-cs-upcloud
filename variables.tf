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


# ssh-keygen -q -C "${USER}@cstacks-terraform" -t ed25519 -N '' -f ~/.ssh/cstacks-terraform <<<y >/dev/null 2>&1 && cat ~/.ssh/cstacks-terraform.pub
# Should also be installed into your DO Account and fingerprint listed above.
# This is used to populate the inventory.yml file and will be used by Ansible to provision.
variable "ssh_connection_priv_key_path" {
  type = string
  default = "~/.ssh/id_rsa"
  description = "Path to your private key"
}

variable "ssh_keys" {
  type = list
  default = []
}

##
# Virtual Machine Image Selection

variable "debian_init_script" {
  type = string
  default = "apt-get update && apt-get -y install apt-utils software-properties-common jq curl wget lsb-release iputils-ping vim openssl dnsutils ca-certificates linux-headers-amd64 python3 python3-pip python3-openssl python3-apt"
}

variable "debian_template_id" {
  type = string
  default = "01000000-0000-4000-8000-000020070100"
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
  default = "1xCPU-1GB"
}
variable "plan_backup_disk" {
  type = number
  default = 25
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

##
# CloudFlare Auto Provisioning
#acme_cf_token: "" # API Token
#acme_cf_account: "" # Account ID
variable "cloudflare_api_token" {
  type = string
  default = ""
}
variable "cloudflare_account_id" {
  type = string
  default = ""
}
variable "cloudflare_proxied" {
  type = bool
  default = false
  description = "Enable if you want cloudflare to proxy your traffic."
}
