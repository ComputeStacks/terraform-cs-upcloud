terraform {
  required_providers {
    upcloud = {
      source  = "UpCloudLtd/upcloud"
      version = "~> 2.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.5"
    }
  }
}
provider "upcloud" {
	username = var.upcloud_username
  password = var.upcloud_password
}

##
# Password Generation
resource "random_string" "pg_password" {
    length  = 24
    special = false
}
resource "random_string" "loki_password" {
    length  = 24
    special = false
}
resource "random_string" "prometheus_password" {
    length  = 24
    special = false
}
resource "random_string" "backup_key" {
    length  = 24
    special = true
}
resource "random_string" "app_id" {
    length  = 8
    special = false
}
resource "random_string" "network_name" {
    length  = 6
    special = false
}
resource "random_string" "cs_admin_password" {
    length  = 12
    special = true
}
