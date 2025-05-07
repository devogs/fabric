netbox_server_url = "http://localhost:8000"
netbox_api_token  = "45c940230bd185be36a6012fcaa04491f8c54d63"

manufacturers = [
  { name = "Linux" },
  { name = "Cisco" }
]

device_roles = [
  { name = "Kube master", color_hex = "001861" },
  { name = "Kube worker", color_hex = "0040ff" },
  { name = "spine", color_hex = "006100" },
  { name = "leaf", color_hex = "008b00" }
]

platforms = [
  { name = "ubuntu", manufacturer_id = "Linux" },
  { name = "ios", manufacturer_id = "Cisco" }
]

device_types = [
  { model = "Switch", manufacturer_id = "Cisco" },
  { model = "Server", manufacturer_id = "Linux" }
]

tenant_groups = [
  { name = "Devogs", description = "This is the tenant group named as Devogs company" }
]

tenants = [
  { name = "gns3", group_id = "Devogs", description = "This is the tenant for the gns3 server" }
]

vrfs = [
  { name = "MGMT", rd = "65000:100", description = "VRF Management", tenant_id = "gns3" },
  { name = "FABRIC", rd = "65000:200", description = "VRF Fabric", tenant_id = "gns3" }
]

regions = [
  { name = "Hauts-de-France", description = "Gravelines is in region HDF" }
]

site_groups = [
  { name = "OVH", description = "This is the OVH site group" }
]

sites = [
  {
    name        = "Gravelines"
    facility    = "Data center"
    latitude    = "51.0166"
    longitude   = "2.1550"
    status      = "active"
    timezone    = "Europe/Paris"
    region_id   = "Hauts-de-France"
    group_id    = "OVH"
    tenant_id   = "gns3"
    description = "This is the site where the IaaS is"
  },
  {
    name        = "local"
    facility    = "lab"
    latitude    = ""
    longitude   = ""
    status      = "active"
    timezone    = "Europe/Paris"
    region_id   = "Hauts-de-France"
    group_id    = "OVH"
    tenant_id   = "gns3"
    description = "This is the site where the lab is"
  }
]

locations = [
  {
    name        = "localhost"
    description = "The local host infra"
    site_id     = "local"
    tenant_id   = "gns3"
  }
]

ipam_roles = [
  { name = "Management" },
  { name = "Fabric interco" },
  { name = "Fabric loopback" }
]

prefixes = [
  {
    prefix      = "172.18.0.0/16"
    status      = "active"
    description = "Management prefix"
    is_pool     = false
    role_id     = "Management"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "MGMT"
  },
  {
    prefix      = "10.100.0.0/16"
    status      = "active"
    description = "Fabric interco prefix"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.250.0/24"
    status      = "active"
    description = "Loopback BGP prefix"
    is_pool     = true
    role_id     = "Fabric loopback"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.1.0/31"
    status      = "active"
    description = "Interco spine-1 to leaf-1"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.1.2/31"
    status      = "active"
    description = "Interco spine-1 to leaf-2"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.1.4/31"
    status      = "active"
    description = "Interco spine-1 to leaf-3"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
 {
    prefix      = "10.100.2.0/31"
    status      = "active"
    description = "Interco spine-1 to leaf-1"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.2.2/31"
    status      = "active"
    description = "Interco spine-1 to leaf-2"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  },
  {
    prefix      = "10.100.2.4/31"
    status      = "active"
    description = "Interco spine-1 to leaf-3"
    is_pool     = true
    role_id     = "Fabric interco"
    site_id     = "local"
    tenant_id   = "gns3"
    vrf_id      = "FABRIC"
  }
]

# devices = [
#   {
#     name           = "spine-1"
#     device_type_id = "Switch"
#     role_id        = "spine"
#     site_id        = "local"
#   }
# ]