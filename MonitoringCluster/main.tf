module "monitoringcluster1" {
  source = "../modules/terraform-vsphere-vm"
  dc = ""
  vmrp = ""
  vmtemp = ""
}