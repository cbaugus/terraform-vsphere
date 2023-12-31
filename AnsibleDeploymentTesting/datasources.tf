data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "resource_pool" {
  name          = "${data.vsphere_compute_cluster.compute_cluster.name}/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template_ubuntu" {
  name          = var.vsphere_template_ubuntu
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template_debian" {
  name          = var.vsphere_template_debian
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template_centos" {
  name          = var.vsphere_template_centos
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "template_photon" {
  name          = var.vsphere_template_photon
  datacenter_id = data.vsphere_datacenter.dc.id
}
