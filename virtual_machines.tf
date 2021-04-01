# Using private module

# Create small Ubuntu VMs
module "ubuntu_virtual_machine_small" {
  source  = "app.terraform.io/your_TFC_org/module/name"
  version = "0.1.1"
  vm_size = "small"
  name = "ubuntu-demo-small-tf"
  port_group = "${local.vmw_pg_details.tenant}|${local.vmw_pg_details.ap}|${local.vmw_pg_details.epg}"
}