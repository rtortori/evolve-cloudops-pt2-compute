locals {
  vmware_pg_from_networking_state = data.terraform_remote_state.aci_epgs.outputs.vmware_port_group
  # Sample result: uni/tn-common/ap-myap/epg-myepg

  epgdata = {
    tenant = split("/", local.vmware_pg_from_networking_state)[1]
    ap     = split("/", local.vmware_pg_from_networking_state)[2]
    epg    = split("/", local.vmware_pg_from_networking_state)[3]
  }

  vmw_pg_details = {
    tenant = substr(local.epgdata.tenant, 3, 100) #we remove the tn- prefix
    ap     = substr(local.epgdata.ap, 3, 100)     #we remove the ap- prefix
    epg    = substr(local.epgdata.epg, 4, 100)    #we remove the epg- prefix
  }
}
