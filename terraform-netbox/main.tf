terraform {
  required_providers {
    netbox = {
      source  = "e-breuninger/netbox"
      version = "3.10.0"
    }
  }
}

provider "netbox" {
  server_url = var.netbox_server_url
  api_token  = var.netbox_api_token
}

# Load device configurations from YAML files
locals {
  device_configs = [
    for file in fileset("${path.module}/data/devices", "*.yaml") :
    yamldecode(file("${path.module}/data/devices/${file}"))
  ]
}

module "manufacturer" {
  source = "./modules/manufacturer"
  providers = {
    netbox = netbox
  }
  manufacturers = var.manufacturers
}

module "device_role" {
  source = "./modules/device_role"
  providers = {
    netbox = netbox
  }
  device_roles = var.device_roles
}

module "platform" {
  source = "./modules/platform"
  providers = {
    netbox = netbox
  }
  platforms = var.platforms
  manufacturer_ids = module.manufacturer.manufacturer_ids
}

module "device_type" {
  source = "./modules/device_type"
  providers = {
    netbox = netbox
  }
  device_types = var.device_types
  manufacturer_ids = module.manufacturer.manufacturer_ids
}

module "tenant" {
  source = "./modules/tenant"
  providers = {
    netbox = netbox
  }
  tenant_groups = var.tenant_groups
  tenants       = var.tenants
}

module "vrf" {
  source = "./modules/vrf"
  providers = {
    netbox = netbox
  }
  vrfs = var.vrfs
  tenant_ids = module.tenant.tenant_ids
}

module "site" {
  source = "./modules/site"
  providers = {
    netbox = netbox
  }
  regions      = var.regions
  site_groups  = var.site_groups
  sites        = var.sites
  locations    = var.locations
  tenant_ids   = module.tenant.tenant_ids
}

module "ipam" {
  source = "./modules/ipam"
  providers = {
    netbox = netbox
  }
  ipam_roles = var.ipam_roles
  prefixes   = var.prefixes
  site_ids   = module.site.site_ids
  tenant_ids = module.tenant.tenant_ids
  vrf_ids    = module.vrf.vrf_ids
}

module "device" {
  source = "./modules/device"
  providers = {
    netbox = netbox
  }
  device_configs   = local.device_configs
  device_type_ids  = module.device_type.device_type_ids
  role_ids         = module.device_role.role_ids
  site_ids         = module.site.site_ids
  vrf_ids          = module.vrf.vrf_ids
  tenant_ids       = module.tenant.tenant_ids
}