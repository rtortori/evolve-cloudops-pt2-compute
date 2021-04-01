# Fetch networking team remote state 
data "terraform_remote_state" "aci_epgs" {
  backend = "remote"

  config = {
    organization = "net_team_TFC_org"
    workspaces = {
      name = "net_team_TFC_workspace"
    }
  }
}

# Fetch the target cluster specs as defined in the common vm specs variable (map)
data "intersight_virtualization_vmware_cluster" "vmware_cluster" {
  name = var.common_vm_specs["vm_cluster"]
}