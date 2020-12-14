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

variable "private_network" {
	type = string
	default = "10.0.0.0/24"
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

# Backup
variable "plan_backup" {
	type = string
	default = "2xCPU-4GB"
}
variable "plan_backup_disk" {
	type = number
	default = 80
}

# Misc
variable "init_script" {
	type = string
	default = "yum -y update && yum -y install epel-release kernel-headers && yum -y install ansible && sed -i 's/SELINUX=.*/SELINUX=enforcing/g' /etc/selinux/config && touch /.autorelabel; reboot"
}

variable "template_id" {
	type = string
	default = "01000000-0000-4000-8000-000050010300" # CentOS 7
}
